open Core

type company = Invalid | Samsung | Apple [@@deriving yojson, sexp]

module HcmInfo = struct
  type t = { company : company [@key "Company"] } [@@deriving yojson, sexp]
end

let () =
  let json = Yojson.Safe.from_string {| { "Company": "Samsung" } |} in
  let hcm_info = HcmInfo.t_of_yojson json in

  hcm_info |> HcmInfo.sexp_of_t |> Sexp.to_string_hum |> printf "%s\n"

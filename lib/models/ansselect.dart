import 'dart:convert';

AnsSelect ansSelectFromJson(String str) => AnsSelect.fromJson(json.decode(str));

String ansSelectToJson(AnsSelect data) => json.encode(data.toJson());

class AnsSelect {
    String? ans;
    bool? selected;

    AnsSelect({
        this.ans,
        this.selected=false,
    });

    factory AnsSelect.fromJson(Map<String, dynamic> json) => AnsSelect(
        ans: json["ans"],
        selected: json["selected"],
    );

    Map<String, dynamic> toJson() => {
        "ans": ans,
        "selected": selected,
    };
}
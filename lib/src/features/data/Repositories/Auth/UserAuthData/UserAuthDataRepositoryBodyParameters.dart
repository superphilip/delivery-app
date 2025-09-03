

class GetUserDataBodyParameters {
    String? idToken;

    GetUserDataBodyParameters({
        this.idToken,
    });

    Map<String, dynamic> toMap() => {
        "idToken": idToken,
    };
}

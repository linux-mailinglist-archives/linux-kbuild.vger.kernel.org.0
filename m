Return-Path: <linux-kbuild+bounces-9360-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E950FC28CEB
	for <lists+linux-kbuild@lfdr.de>; Sun, 02 Nov 2025 10:57:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BCC454E3497
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Nov 2025 09:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1862A222580;
	Sun,  2 Nov 2025 09:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hrSH6BPo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8FE1D5CFB;
	Sun,  2 Nov 2025 09:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762077396; cv=none; b=neDndaVXd2qbvjhwfkFhJq12NV7TeU8OHTO8+uKV/05tiLAE7s3tJ24Gb4eTkR93RB2genFLXt0m4vj3yKdpJee6vo0NEEpLigcCsVgK30g1pm6JhxqPBJkijtFFe/cmUrPyTu0+VN7+foqAwrckR0Z0gONVaXESP1SaLZTiLrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762077396; c=relaxed/simple;
	bh=tgoHUy8+dU5pLodr/+YdTz0qC9rjIrbBAsZbExT0RNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GnckBfQI6Y8UVFscZ2kv/hPByqXYsV2qhbR4dhX7q7msgst0PLXjgKVMm116qyOZIdIL8D1M8AiIROXElQpodgsrhMgUqNkFBBb0FB7ul2Vy+0xPoI6kL/t73V7GBZC6kiHZxja9Kvjyt2lRpaDiN0+2xCmMtPpdeaKaio3gZJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hrSH6BPo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8B48C4CEF7;
	Sun,  2 Nov 2025 09:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762077395;
	bh=tgoHUy8+dU5pLodr/+YdTz0qC9rjIrbBAsZbExT0RNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hrSH6BPouyh++5y9DASNRzX9q7jiEkWxuufvkhXRpupzUVbTpRh7VvaqlSZ/U9s/l
	 NxhGNGGgSwKHD/WsLIT7disUtJna3daSwaiEZz14yRpGXXMjlcS7NNi47J/6k4UiCy
	 kmTu90Y0GVbv8n4cPsE7fEGgOzdhB/E1Fvd4bHif6dm50aWglpmQj5iItCOQn+4/7M
	 QBAnt0jC97Ap951ppM3PozH9LzlL5AqGrBVS/mKk4QzohdjWpIkRsCTSlTNNT58z/C
	 GG6SnG5nCEgP2wNFJG04/wVuE9IyjW5MG8lTovWeRwjTiITN0nznHRTl+UfuAXpY83
	 H3SNguxq7R37g==
Date: Sun, 2 Nov 2025 10:56:32 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Daniel Gomez <da.gomez@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Trevor Gross <tmgross@umich.edu>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, Greg KH <gregkh@linuxfoundation.org>, 
	Fiona Behrens <me@kloenk.dev>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-modules@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, 
	linux-next@vger.kernel.org
Subject: Re: [PATCH v18 0/7] rust: extend `module!` macro with integer
 parameter support
Message-ID: <er7h34im2rk627usnvbre3clqvsx3uzev7kboy33pd7oac747c@nvtl7y2mmdde>
References: <20250924-module-params-v3-v18-0-bf512c35d910@kernel.org>
 <49af6d76-bcb7-4343-8903-390040e2c49b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kgnqphnahpvonngh"
Content-Disposition: inline
In-Reply-To: <49af6d76-bcb7-4343-8903-390040e2c49b@kernel.org>


--kgnqphnahpvonngh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v18 0/7] rust: extend `module!` macro with integer
 parameter support
MIME-Version: 1.0

Hello Daniel,

[Adding Stephen and linux-next to Cc]

On Sat, Nov 01, 2025 at 10:39:08PM +0100, Daniel Gomez wrote:
> On 24/09/2025 14.39, Andreas Hindborg wrote:
> > Extend the `module!` macro with support module parameters. Also add some
> > string to integer parsing functions.
> >=20
> > Based on the original module parameter support by Miguel [1],
> > later extended and generalized by Adam for more types [2][3].
> > Originally tracked at [4].
> >=20
> > Link: https://github.com/Rust-for-Linux/linux/pull/7 [1]
> > Link: https://github.com/Rust-for-Linux/linux/pull/82 [2]
> > Link: https://github.com/Rust-for-Linux/linux/pull/87 [3]
> > Link: https://github.com/Rust-for-Linux/linux/issues/11 [4]
> > Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>=20
> I tested this series with rust_minimal module. They LGTM,
>=20
> Tested-by: Daniel Gomez <da.gomez@samsung.com>
>=20
> The patches did not apply cleanly to v6.18-rc3, at least not when using b=
4.
> However, when applying them to the base commit and then rebasing onto v6.=
18-rc3,
> I didn't see any conflicts.

I don't know how you use b4, but

	git checkout v6.18-rc3
	b4 am -3 49af6d76-bcb7-4343-8903-390040e2c49b@kernel.org
	git am -3 ./v18_20250924_a_hindborg_rust_extend_module_macro_with_integer_=
parameter_support.mbx

works fine on my end. Using `-3` should have the same effect as applying
the series on top of the original base and rebase it.

	git fetch https://git.kernel.org/pub/scm/linux/kernel/git/modules/linux.gi=
t rebase/20250924-module-params-v3-v18-0-bf512c35d910@kernel.org
	git range-diff FETCH_HEAD...HEAD

confirms that.
=20
> I've created a temporary branch with this rebase here:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/modules/linux.git/log/?h=
=3Drebase/20250924-module-params-v3-v18-0-bf512c35d910@kernel.org
>=20
> Can you take a look when you can? I'll merge this shortly after checking =
with
> Uwe, as there are some minor conflicts with his tree.
>=20
> + Uwe
>=20
> These are the conflicts I see when merging the patch series from Michal [=
1]
> (Introduce import_ns support for Rust). I believe these are trivial thing=
s that
> we will get notified from linux-next merging. But let me know what you th=
ink as
> you have requested in that thread.
>=20
> [1] Link: https://lore.kernel.org/all/20251028-pwm_fixes-v1-0-25a532d3199=
8@samsung.com/

Yeah, I expect that Stephen will highlight the conflicts, but I prefer
to not be surprised by that and consider linux-next more a fallback
security net that I don't want to use. I like it to be the other way
round and tell Stephen about conflicts to expect :-)

> ...
> Applying: rust: macros: Add support for 'imports_ns' to module!
> Patch failed at 0008 rust: macros: Add support for 'imports_ns' to module!
> error: patch failed: rust/macros/module.rs:98
> error: rust/macros/module.rs: patch does not apply
> hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
> hint: When you have resolved this problem, run "git am --continue".
> hint: If you prefer to skip this patch, run "git am --skip" instead.
> hint: To restore the original branch and stop patching, run "git am --abo=
rt".
> hint: Disable this message with "git config set advice.mergeConflict fals=
e"
>=20
> git am --show-current-patch=3Ddiff

That command shows the patch to apply, but not the conflict, let alone
your resolution.

> ---
>  rust/macros/module.rs | 8 ++++++++
>  1 file changed, 8 insertions(+)
> ---
>  rust/macros/module.rs | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/rust/macros/module.rs b/rust/macros/module.rs
> index 5ee54a00c0b65699596e660b2d4d60e64be2a50c..408cd115487514c8be79724d9=
01c676435696376 100644
> --- a/rust/macros/module.rs
> +++ b/rust/macros/module.rs
> @@ -98,6 +98,7 @@ struct ModuleInfo {
>      description: Option<String>,
>      alias: Option<Vec<String>>,
>      firmware: Option<Vec<String>>,
> +    imports_ns: Option<Vec<String>>,
>  }

So here the addition of `params` is missing.

> [...]

When I merge your branch mentioned above with my pwm/for-next and
resolve the merge conflicts, the resolution looks as follows. The only
non-trivial thing is that

	if let Some(imports) =3D info.imports_ns {

now needs a & for `info`.

Best regards
Uwe

diff --cc rust/macros/module.rs
index d62e9c1e2a89,408cd1154875..000000000000
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@@ -205,50 -98,7 +205,51 @@@ struct ModuleInfo=20
      description: Option<String>,
      alias: Option<Vec<String>>,
      firmware: Option<Vec<String>>,
+     imports_ns: Option<Vec<String>>,
 +    params: Option<Vec<Parameter>>,
 +}
 +
 +#[derive(Debug)]
 +struct Parameter {
 +    name: String,
 +    ptype: String,
 +    default: String,
 +    description: String,
 +}
 +
 +fn expect_params(it: &mut token_stream::IntoIter) -> Vec<Parameter> {
 +    let params =3D expect_group(it);
 +    assert_eq!(params.delimiter(), Delimiter::Brace);
 +    let mut it =3D params.stream().into_iter();
 +    let mut parsed =3D Vec::new();
 +
 +    loop {
 +        let param_name =3D match it.next() {
 +            Some(TokenTree::Ident(ident)) =3D> ident.to_string(),
 +            Some(_) =3D> panic!("Expected Ident or end"),
 +            None =3D> break,
 +        };
 +
 +        assert_eq!(expect_punct(&mut it), ':');
 +        let param_type =3D expect_ident(&mut it);
 +        let group =3D expect_group(&mut it);
 +        assert_eq!(group.delimiter(), Delimiter::Brace);
 +        assert_eq!(expect_punct(&mut it), ',');
 +
 +        let mut param_it =3D group.stream().into_iter();
 +        let param_default =3D expect_param_default(&mut param_it);
 +        let param_description =3D expect_string_field(&mut param_it, "des=
cription");
 +        expect_end(&mut param_it);
 +
 +        parsed.push(Parameter {
 +            name: param_name,
 +            ptype: param_type,
 +            default: param_default,
 +            description: param_description,
 +        })
 +    }
 +
 +    parsed
  }
 =20
  impl ModuleInfo {
@@@ -263,7 -113,7 +264,8 @@@
              "license",
              "alias",
              "firmware",
+             "imports_ns",
 +            "params",
          ];
          const REQUIRED_KEYS: &[&str] =3D &["type", "name", "license"];
          let mut seen_keys =3D Vec::new();
@@@ -289,7 -139,7 +291,8 @@@
                  "license" =3D> info.license =3D expect_string_ascii(it),
                  "alias" =3D> info.alias =3D Some(expect_string_array(it)),
                  "firmware" =3D> info.firmware =3D Some(expect_string_arra=
y(it)),
+                 "imports_ns" =3D> info.imports_ns =3D Some(expect_string_=
array(it)),
 +                "params" =3D> info.params =3D Some(expect_params(it)),
                  _ =3D> panic!("Unknown key \"{key}\". Valid keys are: {EX=
PECTED_KEYS:?}."),
              }
 =20
@@@ -329,25 -179,30 +332,30 @@@ pub(crate) fn module(ts: TokenStream) -
      // Rust does not allow hyphens in identifiers, use underscore instead.
      let ident =3D info.name.replace('-', "_");
      let mut modinfo =3D ModInfoBuilder::new(ident.as_ref());
 -    if let Some(authors) =3D info.authors {
 +    if let Some(authors) =3D &info.authors {
          for author in authors {
 -            modinfo.emit("author", &author);
 +            modinfo.emit("author", author);
          }
      }
 -    if let Some(description) =3D info.description {
 -        modinfo.emit("description", &description);
 +    if let Some(description) =3D &info.description {
 +        modinfo.emit("description", description);
      }
      modinfo.emit("license", &info.license);
 -    if let Some(aliases) =3D info.alias {
 +    if let Some(aliases) =3D &info.alias {
          for alias in aliases {
 -            modinfo.emit("alias", &alias);
 +            modinfo.emit("alias", alias);
          }
      }
 -    if let Some(firmware) =3D info.firmware {
 +    if let Some(firmware) =3D &info.firmware {
          for fw in firmware {
 -            modinfo.emit("firmware", &fw);
 +            modinfo.emit("firmware", fw);
          }
      }
 -    if let Some(imports) =3D info.imports_ns {
++    if let Some(imports) =3D &info.imports_ns {
+         for ns in imports {
+             modinfo.emit("import_ns", &ns);
+         }
+     }
 =20
      // Built-in modules also export the `file` modinfo string.
      let file =3D

--kgnqphnahpvonngh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmkHKs4ACgkQj4D7WH0S
/k6OgQgAlcauM7xGKbpjm5qIev+NmA2vRTzzTK4tqT2HQAgD4WBmMXX/Uu3xfBE8
lgPxMkxCPbx7zwLtLEZQG4yT4gcizoXBuC8K0zc3Oft5Eqjd1q9f/FAWGGJbxwtR
TunQpOyK8A3G1WX1gjS7y5PodMpSt1T743LhLZlemtQPNQKA3IsU1i1dKY0lTAeD
ibjxpuf4Eog/4DCIQ2VTVEVRZd35U2bS6USYNn6hvkwWJHiJvv44zfYfwCpZn/sw
YKCcS/2x/WQ2QfKtHHKhCiQAi2Z1yW0YOiqTKCJXTm1Q64TOLrLHBukF7A34S7U4
yxZcp0HQUBS8AxdF4N2RMOScOJb4Tg==
=fDE6
-----END PGP SIGNATURE-----

--kgnqphnahpvonngh--


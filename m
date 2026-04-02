Return-Path: <linux-kbuild+bounces-12600-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4H3dFOFfzmnvnAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12600-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 14:24:01 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10209389001
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 14:23:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27CF4303A8F4
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2026 12:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 483DA3CB2DC;
	Thu,  2 Apr 2026 12:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hrzd4OPn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C975B3CD8AB
	for <linux-kbuild@vger.kernel.org>; Thu,  2 Apr 2026 12:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775132589; cv=pass; b=KIZrVvJEi50ckTmji4A/wtRYGz4nzD8uexdLVsralI8jE4JLsDEp7/s/azd9Xmi5CvpevI/r9zZKeL5f3z0U81RjkcC2Sck22miC+PXQVKzaUBjFJlOY2LOlLmSa/O9DcYRNWrEMAQgr41IChqzQz/lBZUiWBD5qBKw6Ft5gUAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775132589; c=relaxed/simple;
	bh=vNk2YfyFJtojxIBisEYJvJSZYcidlJbrWJ6Lt/aJdPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qcdIX7poeBsHWLnuuE37GAIaKbg28MCfbbV+UFx9YeGxk+MGUGYX+6CV9qJgXjlBN1R03HU45+8caG6XNfR69pc+DQVphOzmqUqcWb1Zcfhm6TcicWybMqL6vgdkail5mqXFYFkbP52egeaoSL+IoO/UJLfs10RpU19U0tzFzrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hrzd4OPn; arc=pass smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-67c641dfaceso296633eaf.3
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Apr 2026 05:23:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775132587; cv=none;
        d=google.com; s=arc-20240605;
        b=NdH5EOr2tPFmkiEQdT1Fr8Xp3NjOfaoRF45tdiv8RoD5bHpB9RyWCKGJcIM8XqzjaL
         WM3yLnhOzhQsMGgzjFMRosHdkLYVFbvl6QkDBm4F0/nthxeyxqDGkObA8L5kJKEXMGyW
         Srehqmmp6yh2GS4gArAePte9RlTlM7zrY94MPbhR/V9wvnzLRamCWRKTlM8BB3uBKVXV
         cLNgHqnoiDnEl6eEZ3I/BFbfuGDB8thJfmG9O5wTYUNAdWL+sLp0lkIog/Kyznf+okSe
         z6oqfElzUy+NyH2sA8POi5pn79zl5QvGkTQKtkObp33gLuKjmZMQuXx9J17iDQA+7orM
         gZcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QkRAgGLloN0xpmPX7jWRG+Y9M4b+GXFLyvozVMZmQ9E=;
        fh=VWFJ9lxV8VSeyHSRgJqEVevHtRTcvKxzQJvfotPFOQ4=;
        b=EQlbS22qor2NIl8wCQSRLoUWvwefTTcD27jz1wxod7YECLSV0E1tlDnzvuqfPuEjaQ
         2JL6M7g9IZ2wuvKxGPozl4pB6np0FeL0VAFPb93/KjGhJDyiLgkJckwEp5lQH0U/CVaG
         0AI20wqLldtcO0ywVyEbECX0rmlXITFEL2Nz5pYUeElrovn9qG+8ZIq9pBSJdn33WfTK
         Uwqszs44nNa3DFcYYzowOpNhNWFcPOa6w9DkoeOGByR3MV7ViUOEygNq1+CO8dQInVZl
         M6N4LT23L2yJx5GYdgeZyN2a8QNJIlRXOoCky0DEyyzsk3cboVlA/qIDZmkB5yVEBYWs
         3lRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775132587; x=1775737387; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkRAgGLloN0xpmPX7jWRG+Y9M4b+GXFLyvozVMZmQ9E=;
        b=Hrzd4OPnCkSA+8gtZV1UU9vrVjoUSG/HnE0PDFdRLPVaq9ubJZ+Zp7u6doCdDxhup6
         bW4hSuvpbsFmcTP9DqVMwVLQZyOff46nku4uG27ee4SMPtopmstLs134mcuw1XsdVwH5
         NkoxqJBQK3jTPP64Ygu/hD/XdsDHmGxQoLKO8dcvE/VEQW2IWDX0Y4Yq2IxPSHI2tZ1O
         rZNS4ywdSLI1IcDzwuSTBfDVWQfw0lpECxMtqGKud2uD7e7lVA1bAGuhnJW9NjwC0arJ
         1SGhFy12SleQGb/4gd7izVbM2HssrNOp3H2ZJEagT5TrXvcnAqh8WN0VWrxgL93BOAyk
         sc/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775132587; x=1775737387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QkRAgGLloN0xpmPX7jWRG+Y9M4b+GXFLyvozVMZmQ9E=;
        b=jC+UJmQmU8shwGjhInpGJc8O91Aw5pjUDmwuPMtmtZ6ZbURR4zOm9YbZy9fCaNfluU
         y0qgL3F8MMioIPx8ALCcUu4ftifcvgxi4p4AqfAgtDUt4XyF5eqtyAwz4fozvEMm5oxK
         ifdq5h0DaCuiiwh9NwVd6Addfw/kOMkemWIRCklcXLwRRSvLQwHllsiKmpsQlZaqgY7J
         yxHacW+IjGFxbHzzjr9XkOwZIrWR4YSjnQbbelbdoNkgSQjJBnOQn0+jBvgEGXnDjvFL
         2c2FNLpTHXct8AMUyIsP7kg2hiZem+ERk5m4xF9kelTvZZ5IOsPaznXY+KlQzfeO36Lv
         AU6w==
X-Forwarded-Encrypted: i=1; AJvYcCUeza7SbmPbyLPAzefPsdSKni2R7/Zs62N4RXvy/+CJxnZf2Z57PqMGov3P5z4wL1Nv7SEdY8kluLVxZrA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/gXosSw2a2YnZW4qsMK1i0yd8pQOV1TIieIyxZn99zB0TtEn9
	tgLouSiRSLIRNfVPq4aWJOy7ZDJFw+EQ+lb7TOT0bWZMZAFhhvVCsdt/bas+9+4MK7/4Uzu3+Mn
	0XDhRk+jyw/voNj1jfSDz0Jif1/AIOwM=
X-Gm-Gg: ATEYQzylAukDwdoikbjr7Z1CbKlaSohfm30GVcyaTzRlupixAzdNlZN0cd9Riv2MIDi
	JN86IdAHNvPl73G3oqHqCHTE936nWxG211vRdSWaT/8CuDvTVlwSKhWKCPIAPyA+10Xo77RJ0Eb
	/x9rABDZyQ8dshia4e/J0fxLVd6trFWlge6G9tJgm6lb045sFAiLGMAi9VMRROTzeSGE7gvlJZW
	JgmpwF1zrXQJEBmQE2tSRxxL2XjOzc/N0r74Tey0WIrUiqntLgentGV4+dMBfNjKAjJgcxQJ+1a
	fZG6LSQ=
X-Received: by 2002:a05:6820:823:b0:67d:f55b:a992 with SMTP id
 006d021491bc7-680a7e5c101mr1497873eaf.46.1775132586668; Thu, 02 Apr 2026
 05:23:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402-binder-crate-name-v4-0-ec3919b87909@google.com> <20260402-binder-crate-name-v4-1-ec3919b87909@google.com>
In-Reply-To: <20260402-binder-crate-name-v4-1-ec3919b87909@google.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Thu, 2 Apr 2026 12:22:54 +0000
X-Gm-Features: AQROBzBRNx153WZo64pYdVSefraS_pL90sNsVFLruIpafoMF23s3DRn-0o76Bg8
Message-ID: <CA+tqQ4+gzV0vA+u-05b3gQfcFAdNchjZjC4Y+D1pBWhHGVuZqg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: support overriding crate_name
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Tamir Duberstein <tamird@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12600-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,linuxfoundation.org,google.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yj3msn@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 10209389001
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 2, 2026 at 10:55=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
[...]
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index b4a55344688d..de6ebf14e2b8 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -12,6 +12,12 @@ import subprocess
>  import sys
>  from typing import Dict, Iterable, List, Literal, Optional, TypedDict
>
> +def invoke_rustc(args):
> +    return subprocess.check_output(
> +        [os.environ["RUSTC"]] + args,
> +        stdin=3Dsubprocess.DEVNULL,
> +    ).decode('utf-8').strip()
> +
>  def args_crates_cfgs(cfgs: List[str]) -> Dict[str, List[str]]:
>      crates_cfgs =3D {}
>      for cfg in cfgs:
> @@ -69,6 +75,9 @@ def generate_crates(
>      crates: List[Crate] =3D []
>      crates_cfgs =3D args_crates_cfgs(cfgs)
>
> +    def get_crate_name(path):
> +        return invoke_rustc(["--print", "crate-name", path])
> +

Could you add type hints to `invoke_rustc` and `get_crate_name`? You can
run the following command to verify if it's all good:

mypy --strict scripts/generate_rust_analyzer.py --python-version 3.9

Once that's done, for the script part:

Reviewed-by: Jesung Yang <y.jems.n@gmail.com>

Best regards,
Jesung

>      def build_crate(
>          display_name: str,
>          root_module: pathlib.Path,
> @@ -112,23 +121,15 @@ def generate_crates(
>              is_workspace_member=3Dis_workspace_member,
>              edition=3Dedition,
>          )
> -        proc_macro_dylib_name =3D (
> -            subprocess.check_output(
> -                [
> -                    os.environ["RUSTC"],
> -                    "--print",
> -                    "file-names",
> -                    "--crate-name",
> -                    display_name,
> -                    "--crate-type",
> -                    "proc-macro",
> -                    "-",
> -                ],
> -                stdin=3Dsubprocess.DEVNULL,
> -            )
> -            .decode("utf-8")
> -            .strip()
> -        )
> +        proc_macro_dylib_name =3D invoke_rustc([
> +            "--print",
> +            "file-names",
> +            "--crate-name",
> +            display_name,
> +            "--crate-type",
> +            "proc-macro",
> +            "-",
> +        ])
>          proc_macro_crate: ProcMacroCrate =3D {
>              **crate,
>              "is_proc_macro": True,
> @@ -324,16 +325,17 @@ def generate_crates(
>      for folder in extra_dirs:
>          for path in folder.rglob("*.rs"):
>              logging.info("Checking %s", path)
> -            name =3D path.stem
> +            file_name =3D path.stem
>
>              # Skip those that are not crate roots.
> -            if not is_root_crate(path.parent / "Makefile", name) and \
> -               not is_root_crate(path.parent / "Kbuild", name):
> +            if not is_root_crate(path.parent / "Makefile", file_name) an=
d \
> +               not is_root_crate(path.parent / "Kbuild", file_name):
>                  continue
>
> -            logging.info("Adding %s", name)
> +            crate_name =3D get_crate_name(path)
> +            logging.info("Adding %s", crate_name)
>              append_crate(
> -                name,
> +                crate_name,
>                  path,
>                  [core, kernel, pin_init],
>                  cfg=3Dgenerated_cfg,
>
> --
> 2.53.0.1185.g05d4b7b318-goog
>


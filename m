Return-Path: <linux-kbuild+bounces-382-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEDE81585B
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Dec 2023 09:07:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3BF5B24595
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Dec 2023 08:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20977111B2;
	Sat, 16 Dec 2023 08:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jSK2UsKx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4832113FEA
	for <linux-kbuild@vger.kernel.org>; Sat, 16 Dec 2023 08:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-54744e66d27so6489a12.0
        for <linux-kbuild@vger.kernel.org>; Sat, 16 Dec 2023 00:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702714033; x=1703318833; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nOjFa2rIqskpnYVF/LlaPJJH6zopSi0F4Nj5oIjOzkQ=;
        b=jSK2UsKxn54ZjwZPeBpgsIx/Heg+l1iu+zL+EHustN12YiIe6jP7ukWsEEMJAwqQNe
         sSXzVL6v7ooO3+c0YgIL9zZwYZ3Hn/QUPRKsPuw4fci1SjdJ6owShklIiOhft3PFrzXm
         sXWM39MMTbvuAgje1221NBZIVE8tKt5E3kDrbBypEZcWwL9KFLSL1hPn9gpl1J7jnjAK
         NACc4lQsfI7SuHQ60bDVys2hJVZb1Jk/V4UHDxagqwrQ56kP+nvcVQzc3lGKBp6+9gUH
         E1QMBmHdvoykoKVCarM5G7z2C44TQjVIW/riKhUoI3GpFb/uIY4Z0SHJxCvfMwvr20Xg
         LBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702714033; x=1703318833;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nOjFa2rIqskpnYVF/LlaPJJH6zopSi0F4Nj5oIjOzkQ=;
        b=D3flMpG+EGAt4e+H5NszKKFfzwtoUM2f/Cz8RfsV7ANcuK2qYohpJpYLX7ZktRavPJ
         3ouWKTC+LzCo7wMQL40NNNVAc/C2pSsTYd7Jjm1nbsQ2HCtgACrpdVJ2kdRd6yJJCiIr
         TMiSHAH/jVsTEQfcotWrf1V02xCDCVkuJwHFvms+4f6qqwuF/z4j89iINeKXzL3+zAJr
         KC/+rUUbyyBW0nLh/BMB2XAtKBu0UJ1samExo6lmwrcgOiuHPshwingML+lQaUE7LUj7
         uNVCPUZUSGrwbp24B89ATtcGS4pHke6/JC7xA7kcOvULGK0NgHll6o6szZOfhJIjpw60
         CziQ==
X-Gm-Message-State: AOJu0Yw1pG70cP7iryq8niy/VdxuMpJUrxr3QL6JLPt2TcInR2E1cYxl
	3diSSpZEDrqA3SdL1yu2aa9TyunUAkt2Z0af9mk0oaCSiF7N
X-Google-Smtp-Source: AGHT+IH624vssEfVdRoc0VJoUxvMXtz5Z/2ynvAcMILH0wJzVP0Evgf/Gkm1sK+eCX9eoi7Hq8kDczWgZx2mxd4JT3U=
X-Received: by 2002:a50:d756:0:b0:552:365c:6962 with SMTP id
 i22-20020a50d756000000b00552365c6962mr89366edj.2.1702714033302; Sat, 16 Dec
 2023 00:07:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231214222253.116734-1-ojeda@kernel.org> <CABVgOS=LXUzRD-c63sxn0FMfGWvxCPP1t_8nY5Xgk30Y9qMAcw@mail.gmail.com>
 <CANiq72kw326HyrDM0v0mFNu5jfb=eL1a+k-idr-5Vbc6_gmY2A@mail.gmail.com>
In-Reply-To: <CANiq72kw326HyrDM0v0mFNu5jfb=eL1a+k-idr-5Vbc6_gmY2A@mail.gmail.com>
From: David Gow <davidgow@google.com>
Date: Sat, 16 Dec 2023 16:07:00 +0800
Message-ID: <CABVgOSm5ByYGZwYoNaXO92HkvJD6zSLjk=WjkQMoRdURqX38pw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: add `rustupoverride` target
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000002306d8060c9c010d"

--0000000000002306d8060c9c010d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 15 Dec 2023 at 19:27, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, Dec 15, 2023 at 8:38=E2=80=AFAM David Gow <davidgow@google.com> w=
rote:
> >
> > Would having similar targets for bindgen help? What about having this
> > install rust-src? Updating / installing those required a lot more
> > looking up of documentation (and then adding --force), so it'd be nice
> > if there were some way to do a similar override or make target.
>
> Which docs did you need to check? i.e. we have the commands for those
> steps in the Quick Start guide. I think you may be referring to the
> case when switching between LTS and mainline, due to the `bindgen-cli`
> vs. `bindgen` name change that the tool did (since that is where
> `--force` is required, not for normal upgrading or downgrading). That
> is definitely a bit painful :-( At least `cargo` mentions the need for
> `--force` in that case. Or are you referring to something else?

Yeah, I only needed to check the Quick Start guide, but had to look at
all three sections (rustc, rust-src, bindgen), which

And yes, it looks like the bindgen/bindgen-cli name change was what
was causing my issues. If that's only a one-off, then we should be
fine. (

> I considered having a `rustupsetup` target (or script) instead that
> does everything (with a `BUILDONLY=3D1` option or similar, given some
> dependencies are not strictly needed for building), since having all
> this "switching logic" is useful, but then:
>
>   - I am not sure we should "hide" the details of the setup too much:
> I thought `rustupoverride` would be OK-ish because the output
> directory is needed (so it is justified) and the command is
> straightforward, but the others do not "need" that information.

Yeah; I'm a bit conflicted here as well. A part of me thinks that, if
we're adding make targets, doing them for everything would be more
consistent, but it does add some 'unnecessary' targets, which is
probably not worth it just to look nice.

>   - If we include `bindgen` there, it wouldn't be `rustup`-only
> anymore, so perhaps we would need another name like `rustsetup`. But
> that may mislead others (e.g. those looking at the Make help), because
> it is just one way of setting things up and it is not required.
> Perhaps this can be alleviated by not including it in the `make help`,
> so that everybody comes from the Quick Start guide and thus hopefully
> they have read the document at least diagonally :)

Personally, I'd love a 'make rustsetup' or similar, but I do agree it
could be misleading, particularly long-term.

The real advantage to it is while we're depending on unstable things
and changing versions regularly. I don't think the one-off setup is
tricky (and the documentation is good), it's the need to upgrade
regularly (and, for per-directory overrides, possibly on several
different checkouts). Having a script to 'upgrade everything to the
required version' would be really convenient.

>   - Given there are different ways to set different sub-steps, and the
> fact that we don't have such a script for C does not have (please
> correct me if I am wrong -- I am aware of Thorsten's recent guide,
> which covers `apt` etc., but that is a Quick Start-like approach
> rather than automated script), I am not sure it would be welcome as a
> Make target (but perhaps it would be fine as a script?). Masahiro may
> have some guidelines here.
>
>   - In the future we may have to change how the setup works or add
> steps, i.e. it is not 100% settled. Thus I am concerned about adding
> complex Make targets that users may start to depend on (i.e. with
> particular/complex semantics), vs. just having docs that are manual.
> For `rustupoverride`, it thought it could be OK-ish because it is just
> a single command and unlikely that it will change (and if we stop
> using it, we can make it empty with a warning and then remove it
> eventually; while it gets harder for more complex ones).
>
> What do you think?

Yeah, on reflection it's definitely not a good long-term solution, as
ideally people will be able to just use whatever rustc version they
have lying around (be it via rustup, or distro packages).

Maybe what we need in the short term is an 'update-rust' script
(possibly living in scripts/, possibly hosted elsewhere, like the
rust-for-linux website), which just does all the steps from the Quick
Start guide automatically? (Even if that's not a good solution
overall, I'll probably throw one together myself just to keep my own
systems up-to-date.)

Still -- none of this is a blocker for this patch.

Cheers,
-- David

--0000000000002306d8060c9c010d
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIPnwYJKoZIhvcNAQcCoIIPkDCCD4wCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ggz5MIIEtjCCA56gAwIBAgIQeAMYYHb81ngUVR0WyMTzqzANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA3MjgwMDAwMDBaFw0yOTAzMTgwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFIzIFNNSU1FIENBIDIwMjAwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCvLe9xPU9W
dpiHLAvX7kFnaFZPuJLey7LYaMO8P/xSngB9IN73mVc7YiLov12Fekdtn5kL8PjmDBEvTYmWsuQS
6VBo3vdlqqXZ0M9eMkjcKqijrmDRleudEoPDzTumwQ18VB/3I+vbN039HIaRQ5x+NHGiPHVfk6Rx
c6KAbYceyeqqfuJEcq23vhTdium/Bf5hHqYUhuJwnBQ+dAUcFndUKMJrth6lHeoifkbw2bv81zxJ
I9cvIy516+oUekqiSFGfzAqByv41OrgLV4fLGCDH3yRh1tj7EtV3l2TngqtrDLUs5R+sWIItPa/4
AJXB1Q3nGNl2tNjVpcSn0uJ7aFPbAgMBAAGjggGKMIIBhjAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0l
BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFHzM
CmjXouseLHIb0c1dlW+N+/JjMB8GA1UdIwQYMBaAFI/wS3+oLkUkrk1Q+mOai97i3Ru8MHsGCCsG
AQUFBwEBBG8wbTAuBggrBgEFBQcwAYYiaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL3Jvb3Ry
MzA7BggrBgEFBQcwAoYvaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvcm9vdC1y
My5jcnQwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9yb290LXIz
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
ddIn9n5Jt6Z1o79zxraLMEwGA1UdIARFMEMwQQYJKwYBBAGgMgEoMDQwMgYIKwYBBQUHAgEWJmh0
dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQCMAAwgZoGCCsG
AQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9jYS9n
c2F0bGFzcjNzbWltZWNhMjAyMDBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5nbG9iYWxzaWdu
LmNvbS9jYWNlcnQvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3J0MB8GA1UdIwQYMBaAFHzMCmjXouse
LHIb0c1dlW+N+/JjMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20v
Y2EvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3JsMA0GCSqGSIb3DQEBCwUAA4IBAQBtHFwIgQZjer5K
H+4Q+wns10k7qN+4wN2Uf+JsyOYjukaMEgdLErfA1wwtQ9uHkoYQZcWBuVVkQFa5hI+sqI2m1Weq
riMCFSiU38s1tADdMX12IMfJRN60Nznhrw+nPyDRZqRhUTW24TwnHorkDnFPW8PHo7fAw4FrpI0n
impZAng7ccvvK09K3ZuhwTIxJMsPXCZYsrXWORTw5sczRAP6XvKbPBJnsJoSTe5dFBPBHOQJOGhU
qWfEfWnWMJPF3LxSGLpLFQXO3RwQqmxv08avwXfVPouh1xuB3FX7rpDabT8YDhu9JgIZkLEKko7L
yQt6zWwng7k8YF/jGbiAta6VMYICajCCAmYCAQEwaDBUMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQ
R2xvYmFsU2lnbiBudi1zYTEqMCgGA1UEAxMhR2xvYmFsU2lnbiBBdGxhcyBSMyBTTUlNRSBDQSAy
MDIwAhABzgV+4+mJnUzG7XDy6d2uMA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCB6
jQTDjJoBw+Ov3pb3xbojPxYVvfaFVLOduyuY7+7l+jAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMzEyMTYwODA3MTNaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAAw/O69K6CbpaW+dDhOTW
m2K6v+gUtXOasClwrwOEOx/B9Phs7bcVfRIFn2qvF9inHUAkCqcZWLleqIpvz/OcwrFAqW9F3/It
HukTmIGdO1wHei5Osp5GOQYgIBw+N6hiHGhXBi418BPaxLtxK1cSftCUZEqeJXjYKOqQqj9Vd+TH
CB+5S1NC+y53wQnZvHzSRdijWK1MR79IueXC7VuyBd4SKwoenmZfANeG5NYk49wDGu9c7a4EYy5a
PwClr4NOZjWJR90YoJr4G+E3Au+TQSXVRxe/cU12hc471U/WXBgz6uAcMSbFMAaXrMGn1G42t/xp
v0V1gzyhL5CJRaVHjQ==
--0000000000002306d8060c9c010d--


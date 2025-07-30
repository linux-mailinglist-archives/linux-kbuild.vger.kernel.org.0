Return-Path: <linux-kbuild+bounces-8252-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D555B1570A
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Jul 2025 03:47:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6520A18A6ADC
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Jul 2025 01:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B032E36E0;
	Wed, 30 Jul 2025 01:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="funMsK/G"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C6A6A33F
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Jul 2025 01:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753840055; cv=none; b=fB/m7x67VfvMqCyqLthhWXM3hwjvzweo/xvOBlhhPYfn/qngKGvCsdLHmqui0g0HXi/T4tS8bm78aNQg44ny4wuxuwdlK38UhMGg9OhD1NsziUWvV/jKsGnKqDQgnbcY+yGyaM9vUG2FGKuiWEjFZpLS1S8KuO06zZhZAKGdb40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753840055; c=relaxed/simple;
	bh=Z9r14FbUrrvUsMu7bRJOFSynnVNgrom35XyPGJR+rVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=icWkZUowlCktPmGYFX8E382ehyp+DSnmMf3mHOx72axDHEWr8EdzMDFT894OjZfgCdjvNEDm1f09q6NavqC6Bfnh4uy/uWqP0MU5RB5msiVXUKfN9rz6Ybrewpy9OU2/aeVr3vDkPOb6fBzd6AuqT3Hd8cBWM9U4Erlj69InQXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=funMsK/G; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6fada2dd785so57930736d6.2
        for <linux-kbuild@vger.kernel.org>; Tue, 29 Jul 2025 18:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753840053; x=1754444853; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3A1uZpw3Q7cRVbTU0y5wFMB+kBpR3cnfD9UYjQB4s3k=;
        b=funMsK/G1PFf2M8R0Wg+91no97YASlr5yDBdy7pZepSENTXbZIJvyuGWP2NK0qbmoS
         oi8NkHfriqL/NQDPO7zZ4f1iiWqe3mvmx8qX4si6S8rXFGqGiwLNATaMvpFgBwivEiuC
         jCWmhxgJBp59ntQP6iTpNSoHx3XCd91ZjGNS8LgWWtolhYtbCKqVFDuMqKBsA0azbf/T
         nPySDFarhO7VEP5CowITbCv+MW8jbbhnQSvuC5SKV+46uae3eKyVdi7+fiLBG4J/kgJD
         2tQgXJGXovfZ+AXCYwVORnWVpyyedtvTeImYJO5S6NmcXZspvOYHrF5KJR3VcXw9eXOH
         rxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753840053; x=1754444853;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3A1uZpw3Q7cRVbTU0y5wFMB+kBpR3cnfD9UYjQB4s3k=;
        b=LOHBO+tSYSdaFWG8mBH4c5GImHm6YfVJ/FwZPtV149MYL48u9iXJwVFpDp5RjAODlS
         b9gwW9t8F28VKG0NqQ1f28KWdLwkPgjuYUe3aub1lozeL1n33ZvR65246MBbjPdjfO8t
         LFQMcXglz7Bi24H5SnazIKDyYIMqHlxg7RPcnnmfL3Rvzz35+U/aL+cFPAP3MMx3RZX7
         49XB+wuMSqeGd3b1y7n0eJ3NhsY916zTj4JcrTb+DWFzSLPcPwmTjPgy190CSag/tyY/
         xePFeNa7/g7TSx5w9F2UPpMyiAQoadGzFY8oGJzr4+eJNPRScOWTs/cgNDpETA2WULnK
         +f0Q==
X-Gm-Message-State: AOJu0Yw9lxGhmZGMT/IdiZqLtFCxHZU/qPor3PTDK5QVBybH0qVDYWgb
	BTrnqW/KoWuxkLh9q9WKsZBJL8Q1CxTD97Ui1z0lGfBv4yWHwRzoc2YBckKXUfl30FVDSoU/Um/
	PvIxJBxCxbl/qc5Z6ZUZXGXORzk30qQJ+Gf6o+7hJ
X-Gm-Gg: ASbGncvsYQiKWCg55gTOcJB5vmx2s+wdeMlt+3uEtfn5DbdfNmecDDp9bXdiN3baovA
	0e50LV0tHOfzIkt7uhsf3ek3MdCtYX9kDuKdIijC4MZhK7Os5IvHU39u18z9tjswIteIW1i4CvP
	ZgkbTMMO8qZNzVBfIY8j9g23LXQxmjOB7NqySzut358wT3SuQMD3jUsxKOQbw0QVBJsxD/8mvLg
	Rxo4kT6
X-Google-Smtp-Source: AGHT+IEAvpxCam+GZD6nlyCjlDX635kD10PgU6jE+054Aeshhj6UBYGswWnUrfTgsTSpbov325rFpFTCG60zSq8jxSw=
X-Received: by 2002:a05:6214:300a:b0:707:44d4:2967 with SMTP id
 6a1803df08f44-707672446e7mr25254436d6.39.1753840052619; Tue, 29 Jul 2025
 18:47:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250729220439.421735-1-tytso@mit.edu>
In-Reply-To: <20250729220439.421735-1-tytso@mit.edu>
From: David Gow <davidgow@google.com>
Date: Wed, 30 Jul 2025 09:47:20 +0800
X-Gm-Features: Ac12FXzB8ssuH2UgjRFc7rL2Da1auGoCNkEvwQIsNaoGeqdA0U0UXqCyZyyCtw0
Message-ID: <CABVgOSmV7hxEiM68=qjgU3m3TrfOMzU3AxZXSRiz7DVwL9Bf6A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: run kunit selftests via the top-level kunit target
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: linux-kbuild@vger.kernel.org, kunit-dev@googlegroups.com
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000005f6de2063b1bb5a6"

--0000000000005f6de2063b1bb5a6
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Jul 2025 at 06:04, Theodore Ts'o <tytso@mit.edu> wrote:
>
> If we can make kunit tests easier to run (currently, the way to run
> them is via "./tools/testing/kunit/kunit.py run") then it's much more
> likely that people will run the Kernel unit tests as part of their
> normal development workflow.
>
> See the discusion linked below for more details about the rationale
> behind this change.
>
> Link: https://groups.google.com/g/kunit-dev/c/aHnAlT13ayU
> Signed-off-by: Theodore Ts'o <tytso@mit.edu>
> ---

Thanks very much.

Unfortunately this isn't working on a clean tree (and possibly having
some issues even on one with an existing .kunit/ build), due to all of
the environment variables (and the working directory) having been
changed by the Makefile, which breaks kunit.py.

I've put a quick hack using `env` to clear the environment below. The
other option would be to modify kunit.py to clean the environment
before shelling out to make, which might be worth doing anyway (though
I'm hesitant to always clear out environment variables).

Cheers,
-- David

>  Makefile | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 478f2004602d..1d5257240a5d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -295,7 +295,7 @@ no-dot-config-targets := $(clean-targets) \
>                          cscope gtags TAGS tags help% %docs check% coccicheck \
>                          $(version_h) headers headers_% archheaders archscripts \
>                          %asm-generic kernelversion %src-pkg dt_binding_check \
> -                        outputmakefile rustavailable rustfmt rustfmtcheck
> +                        outputmakefile rustavailable rustfmt rustfmtcheck kunit
>  no-sync-config-targets := $(no-dot-config-targets) %install modules_sign kernelrelease \
>                           image_name
>  single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.rsi %.s %/
> @@ -2139,6 +2139,15 @@ existing-targets := $(wildcard $(sort $(targets)))
>
>  -include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
>
> +PHONY += kunit
> +kunit:
> +ifeq ($(SRCARCH),x86)
> +       $(Q)$(PYTHON3) $(srctree)/tools/testing/kunit/kunit.py run

This doesn't actually work, as the Makefile has already set a bunch of
environment variables which conflict with the build triggered by
kunit.py

A quick fix seems to be:
---
diff --git a/Makefile b/Makefile
index fab4c47988c1..6e31a9486a06 100644
--- a/Makefile
+++ b/Makefile
@@ -2145,7 +2145,7 @@ existing-targets := $(wildcard $(sort $(targets)))
PHONY += kunit
kunit:
ifeq ($(SRCARCH),x86)
-       $(Q)$(PYTHON3) $(srctree)/tools/testing/kunit/kunit.py run
+       $(Q)env -C$(srctree) -i PATH=$(PATH) TERM=$(TERM) HOME=$(HOME)
$(PYTHON3) $(srctree)/tools/testing/kunit/kunit.py run
else
       @echo >&2 "Kunit not supported on this architecture: $(ARCH)"
       @false
---

> +else
> +       @echo >&2 "Kunit not supported on this architecture: $(ARCH)"

Nit: we tend to use "KUnit" or "kunit" for capitalisation here.

It also might be possible to automatically fall back to the qemu
codepath here, but that's something I'll look at as a kunit.py change,
not a makefile change.

> +       @false
> +endif
> +
>  endif # config-build
>  endif # mixed-build
>  endif # need-sub-make
> --
> 2.47.2
>
> --
> You received this message because you are subscribed to the Google Groups "KUnit Development" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kunit-dev+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/kunit-dev/20250729220439.421735-1-tytso%40mit.edu.

--0000000000005f6de2063b1bb5a6
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIUnQYJKoZIhvcNAQcCoIIUjjCCFIoCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghIEMIIGkTCCBHmgAwIBAgIQfofDAVIq0iZG5Ok+mZCT2TANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNDdaFw0zMjA0MTkwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFI2IFNNSU1FIENBIDIwMjMwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDYydcdmKyg
4IBqVjT4XMf6SR2Ix+1ChW2efX6LpapgGIl63csmTdJQw8EcbwU9C691spkltzTASK2Ayi4aeosB
mk63SPrdVjJNNTkSbTowej3xVVGnYwAjZ6/qcrIgRUNtd/mbtG7j9W80JoP6o2Szu6/mdjb/yxRM
KaCDlloE9vID2jSNB5qOGkKKvN0x6I5e/B1Y6tidYDHemkW4Qv9mfE3xtDAoe5ygUvKA4KHQTOIy
VQEFpd/ZAu1yvrEeA/egkcmdJs6o47sxfo9p/fGNsLm/TOOZg5aj5RHJbZlc0zQ3yZt1wh+NEe3x
ewU5ZoFnETCjjTKz16eJ5RE21EmnCtLb3kU1s+t/L0RUU3XUAzMeBVYBEsEmNnbo1UiiuwUZBWiJ
vMBxd9LeIodDzz3ULIN5Q84oYBOeWGI2ILvplRe9Fx/WBjHhl9rJgAXs2h9dAMVeEYIYkvW+9mpt
BIU9cXUiO0bky1lumSRRg11fOgRzIJQsphStaOq5OPTb3pBiNpwWvYpvv5kCG2X58GfdR8SWA+fm
OLXHcb5lRljrS4rT9MROG/QkZgNtoFLBo/r7qANrtlyAwPx5zPsQSwG9r8SFdgMTHnA2eWCZPOmN
1Tt4xU4v9mQIHNqQBuNJLjlxvalUOdTRgw21OJAFt6Ncx5j/20Qw9FECnP+B3EPVmQIDAQABo4IB
ZTCCAWEwDgYDVR0PAQH/BAQDAgGGMDMGA1UdJQQsMCoGCCsGAQUFBwMCBggrBgEFBQcDBAYJKwYB
BAGCNxUGBgkrBgEEAYI3FQUwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUM7q+o9Q5TSoZ
18hmkmiB/cHGycYwHwYDVR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwewYIKwYBBQUHAQEE
bzBtMC4GCCsGAQUFBzABhiJodHRwOi8vb2NzcDIuZ2xvYmFsc2lnbi5jb20vcm9vdHI2MDsGCCsG
AQUFBzAChi9odHRwOi8vc2VjdXJlLmdsb2JhbHNpZ24uY29tL2NhY2VydC9yb290LXI2LmNydDA2
BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL3Jvb3QtcjYuY3JsMBEG
A1UdIAQKMAgwBgYEVR0gADANBgkqhkiG9w0BAQwFAAOCAgEAVc4mpSLg9A6QpSq1JNO6tURZ4rBI
MkwhqdLrEsKs8z40RyxMURo+B2ZljZmFLcEVxyNt7zwpZ2IDfk4URESmfDTiy95jf856Hcwzdxfy
jdwx0k7n4/0WK9ElybN4J95sgeGRcqd4pji6171bREVt0UlHrIRkftIMFK1bzU0dgpgLMu+ykJSE
0Bog41D9T6Swl2RTuKYYO4UAl9nSjWN6CVP8rZQotJv8Kl2llpe83n6ULzNfe2QT67IB5sJdsrNk
jIxSwaWjOUNddWvCk/b5qsVUROOuctPyYnAFTU5KY5qhyuiFTvvVlOMArFkStNlVKIufop5EQh6p
jqDGT6rp4ANDoEWbHKd4mwrMtvrh51/8UzaJrLzj3GjdkJ/sPWkDbn+AIt6lrO8hbYSD8L7RQDqK
C28FheVr4ynpkrWkT7Rl6npWhyumaCbjR+8bo9gs7rto9SPDhWhgPSR9R1//WF3mdHt8SKERhvtd
NFkE3zf36V9Vnu0EO1ay2n5imrOfLkOVF3vtAjleJnesM/R7v5tMS0tWoIr39KaQNURwI//WVuR+
zjqIQVx5s7Ta1GgEL56z0C5GJoNE1LvGXnQDyvDO6QeJVThFNgwkossyvmMAaPOJYnYCrYXiXXle
A6TpL63Gu8foNftUO0T83JbV/e6J8iCOnGZwZDrubOtYn1QwggWDMIIDa6ADAgECAg5F5rsDgzPD
hWVI5v9FUTANBgkqhkiG9w0BAQwFADBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBS
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
jmkLAgMBAAGjggHgMIIB3DAeBgNVHREEFzAVgRNkYXZpZGdvd0Bnb29nbGUuY29tMA4GA1UdDwEB
/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwHQYDVR0OBBYEFBp5bTxrTm/d
WMmRETO8lNkA4c7fMFgGA1UdIARRME8wCQYHZ4EMAQUBAjBCBgorBgEEAaAyCgMDMDQwMgYIKwYB
BQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQC
MAAwgZoGCCsGAQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWdu
LmNvbS9jYS9nc2F0bGFzcjZzbWltZWNhMjAyMzBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3J0MB8GA1UdIwQYMBaA
FDO6vqPUOU0qGdfIZpJogf3BxsnGMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vY2EvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3JsMA0GCSqGSIb3DQEBCwUAA4ICAQBF
tO3/N2l9hTaij/K0xCpLwIlrqpNo0nMAvvG5LPQQjSeHnTh06tWTgsPCOJ65GX+bqWRDwGTu8WTq
c5ihCNOikBs25j82yeLkfdbeN/tzRGUb2RD+8n9I3CnyMSG49U2s0ZdncsrIVFh47KW2TpHTF7R8
N1dri01wPg8hw4u0+XoczR2TiBrBOISKmAlkAi+P9ivT31gSHdbopoL4x0V2Ow9IOp0chrQQUZtP
KBytLhzUzd9wIsE0QMNDbw6jeG8+a4sd17zpXSbBywIGw7sEvPtnBjMaf5ib3kznlOne6tuDVx4y
QFExTCSrP3OTMUkNbpIdgzg2CHQ2aB8i8YsTZ8Q8Q8ztPJ+xDNsqBUeYxILLjTjxQQovToqipB3f
6IMyk+lWCdDS+iCLYZULV1BTHSdwp1NM3t4jZ8TMlV+JzAyRqz4lzSl8ptkFhKBJ7w2tDrZ3BEXB
8ASUByRxeh+pC1Z5/HhqfiWMVPjaWmlRRJVlRk+ObKIv2CblwxMYlo2Mn8rrbEDyfum1RTMW55Z6
Vumvw5QTHe29TYxSiusovM6OD5y0I+4zaIaYDx/AtF0mMOFXb1MDyynf1CDxhtkgnrBUseHSOU2e
MYs7IqzRap5xsgpJS+t7cp/P8fdlCNvsXss9zZa279tKwaxR0U2IzGxRGsWKGxDysn1HT6pqMDGC
Al0wggJZAgEBMGgwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKjAo
BgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjYgU01JTUUgQ0EgMjAyMwIQAUXA7LnOuRz2DvkWTeMc
0TANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgubgT9nOPPTkZ6dPAzawiCJ4MzFn4
bPNm2iVwHkr85/cwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjUw
NzMwMDE0NzMzWjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcN
AQEBBQAEggEAVbqEBewGKSoNWaVnWrkNlOkD87fwZKbIO/a0v0t42daJbfIQhC8ZpP+Pxb2vpFMs
aOubg5n7u6NSQ1JY93N4yM7xMKW1jtqirAzpmuOzhPSSRYFKlvD4wQofraDdTo6HSo0Dj2vCuWrX
PteponzMDzAFVy76YHSj8NAcN783qMt6BaqSu3g+SypcDyq0j7xEho5aTS9dtK6FU3DsMUYUerrK
RT3RPCFX2irwu5cSR9PrM7VTHviOI9TlmIjl1Ssyib4aiazbd0VHTviQi1WSSvObPrQfKj2KWqwD
9zxmHA0oPTk78/NMmsTi2ickIhOZX7zedeuCrxFbJTQGsjXj4Q==
--0000000000005f6de2063b1bb5a6--


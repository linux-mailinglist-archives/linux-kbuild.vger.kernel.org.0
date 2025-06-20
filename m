Return-Path: <linux-kbuild+bounces-7585-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01340AE1823
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Jun 2025 11:48:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D218A3AFB37
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Jun 2025 09:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A96825B2E8;
	Fri, 20 Jun 2025 09:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rsYqlWZF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFD8229B29
	for <linux-kbuild@vger.kernel.org>; Fri, 20 Jun 2025 09:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750412890; cv=none; b=DpTaJx93x8LpPY3UVaaanJqw+ObNMwdC2aTcE6HJo6VSEO/5XU+aRUmbWrD7QYFMJTrvHaUBvAB8aMWYHHkzKTvDviQBj9d+EMmrOMCHQUR9E2oK7sok5srTt3T3kPG7S8t4ArgYiuQHYGvsLQLfcBuRi6Q/96r8imZXykL1VM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750412890; c=relaxed/simple;
	bh=kQ85ywA4FODGuYzRtF9p0VZskm67GeCMJhXbEItJt4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g1uLVW0p+up/5CDaecvH7l+14873iBod4gmOMSwD9JYy8NYzNaLq5gqoOjo01yhA35ZqiSVft3AXir7xClAcLdZjLr0bBe4TbWm+tnZwq/o5jDzpT/EDC+/YnnnKTNyFNXZmcC0WRil3sh9ywP1gy28DefmGfkpmfu/NqwHmwA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rsYqlWZF; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6fabb948e5aso19710906d6.1
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Jun 2025 02:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750412886; x=1751017686; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rAZEA2FI6XEAJ1GHzrXDPLRM+lQfjXeCIwLJejM6+X8=;
        b=rsYqlWZFlzQwgD8ZlLv4azJvNRJAHkDVGfguiPDm/7Dd945wnGWSOfgvkJ+lQLucwG
         HqatKweYDNvaZ1cWYbBbzH0eQmIpgnW6NXX2ckws3qDZgMPUFO77Yh5qFwcYIfksjPGH
         hf3eeHObVUigP9izNhFDUyJyC8ozEiZAb8SecKKDHW15o8mnoz6PXu3iotqF+nJ/lea7
         V5zew2J7kAht8UJv9GjygewaKx4CjPL8aUUCV+k4fxb/cRlV9MVijbd8Hodipv326iTP
         B3o8VztPf65FWtj05BUtA1hkr5PZjyRK7eek+/MoV8ntUVdNW7QEHPAXC2Te7Jay/r1e
         kvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750412886; x=1751017686;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rAZEA2FI6XEAJ1GHzrXDPLRM+lQfjXeCIwLJejM6+X8=;
        b=e+GcPNIWhTfZhAvsXWYFui6sStqN181sBb7p8wJManmBYtEOk8nQ8x3JJUTwLxr8UG
         Vx9jptOI1lROXF2KWb8nYfCHBGfMCkEgOZDtBf9mzNNCVaG3N8Fa8y7pO7fQlQV5uoVY
         Q1abGjGKkS+886eJKz7fEUT/AthII0YPEu2tQtALqVkOwJ0Hi+uB8eP4r6r0WPEqxb9e
         lnvuZNyzVJPX2DVB5qTJMlRNK6EfaUg9eF2EqFZmmpyP0f9cLzHRbIt5AxWx8Q/dpxHE
         dnBiGhxX4QI5j1NT8KDaTtinhzrajbe4SqDVonXPj8FNB1Qk2LMo/HmtpMgKA0QqO8/n
         FZiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxa16twp4UsHd4QLLu0D2xY0OtL5gyofkWrqBt7ZkpodmHnhWuhdrVYLzXqQpWgyPYUALt146qsPKov+I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP4TWls+b/M3LolQr65D+DPeu4HleNXYpao8W12aHK8xY5tOHX
	79y+k9tRRYiNkeGSrNsbQg9F2xhrFItPzylXlFbFMJfJ6fUPr42MWISmQGGyqA9/FbVsS1HvN1/
	49ISYwztUlmBd3ToB05L5bZwkE4QYlDZZre9H178t
X-Gm-Gg: ASbGnctSwIo1D5Cxx4hhS9A+5R5GS1TJKczMmgUbqNLcQkV/jEwKcMLwcHzJTSMQlgN
	aBdmag/LRTr6Ug5dTLFGE/oYaP4SoazlMK+55uSwx5CI9cgU0MQdFBXeszwHxvAbzbT4MUSsELG
	X7sdDPjb5mQBcZTyatJ53T4T5sSWjW2Nyj69DnuE6MudEFwtoC/Ro9XcsrU8cuFoICPAxW6WPZ3
	7Tglg==
X-Google-Smtp-Source: AGHT+IH2VbZ8sTk8CXNiHNzNudykkei9NhU3ukDwMiIblAxulTl5eCamk8ZeKq8qXzyhGE0u7cw13qLap5kso8QKIUQ=
X-Received: by 2002:a05:6214:20c4:b0:6fb:96:36b0 with SMTP id
 6a1803df08f44-6fd0a576ff9mr32766906d6.31.1750412885855; Fri, 20 Jun 2025
 02:48:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de> <20250611-kunit-kselftests-v3-14-55e3d148cbc6@linutronix.de>
In-Reply-To: <20250611-kunit-kselftests-v3-14-55e3d148cbc6@linutronix.de>
From: David Gow <davidgow@google.com>
Date: Fri, 20 Jun 2025 17:47:52 +0800
X-Gm-Features: Ac12FXzP5bbs3Fo55AZsi6RK7Qdw2kJoFi-CbyZ0DxjszonEa7qJje79mecmEZY
Message-ID: <CABVgOSneoHqQ_1fgQYvE_jj3cZ=wgaxZA7U4-7V0Cqi2JD4yAA@mail.gmail.com>
Subject: Re: [PATCH v3 14/16] kunit: uapi: Add example for UAPI tests
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <rmoar@google.com>, 
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	workflows@vger.kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000004e1fbf0637fdc260"

--0000000000004e1fbf0637fdc260
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 11 Jun 2025 at 15:38, Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> Extend the example to show how to run a userspace executable.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> ---

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David



>  lib/kunit/Makefile             |  9 ++++++++-
>  lib/kunit/kunit-example-test.c | 15 +++++++++++++++
>  lib/kunit/kunit-example-uapi.c | 22 ++++++++++++++++++++++
>  3 files changed, 45 insertions(+), 1 deletion(-)
>
> diff --git a/lib/kunit/Makefile b/lib/kunit/Makefile
> index dafa09bd4241c24d31c4c19edecb67bf724127d7..e406a31df1df834a87961663d=
e0b7921b59481c2 100644
> --- a/lib/kunit/Makefile
> +++ b/lib/kunit/Makefile
> @@ -30,4 +30,11 @@ obj-$(CONFIG_KUNIT_TEST) +=3D          string-stream-t=
est.o
>  obj-$(CONFIG_KUNIT_TEST) +=3D            assert_test.o
>  endif
>
> -obj-$(CONFIG_KUNIT_EXAMPLE_TEST) +=3D    kunit-example-test.o
> +userprogs +=3D                           kunit-example-uapi
> +kunit-example-uapi-userccflags :=3D      -static
> +kunit-example-uapi-nolibc :=3D           $(CONFIG_ARCH_HAS_NOLIBC)
> +blobs +=3D                               kunit-example-uapi.blob.o
> +
> +obj-$(CONFIG_KUNIT_EXAMPLE_TEST) +=3D    kunit-example-mod.o
> +kunit-example-mod-y +=3D                 kunit-example-test.o
> +kunit-example-mod-$(CONFIG_KUNIT_UAPI) +=3D kunit-example-uapi.blob.o
> diff --git a/lib/kunit/kunit-example-test.c b/lib/kunit/kunit-example-tes=
t.c
> index 3056d6bc705d0a8f196f0f4412e679dbb0e03114..b2681a6e047dfd6fea4a7cca6=
0e81651d09c2eae 100644
> --- a/lib/kunit/kunit-example-test.c
> +++ b/lib/kunit/kunit-example-test.c
> @@ -6,8 +6,11 @@
>   * Author: Brendan Higgins <brendanhiggins@google.com>
>   */
>
> +#include <linux/blob.h>
> +
>  #include <kunit/test.h>
>  #include <kunit/static_stub.h>
> +#include <kunit/uapi.h>
>
>  /*
>   * This is the most fundamental element of KUnit, the test case. A test =
case
> @@ -277,6 +280,17 @@ static void example_slow_test(struct kunit *test)
>         KUNIT_EXPECT_EQ(test, 1 + 1, 2);
>  }
>
> +/*
> + * This test shows the usage of UAPI tests.
> + */
> +static void example_uapi_test(struct kunit *test)
> +{
> +       if (IS_ENABLED(CONFIG_KUNIT_UAPI))
> +               kunit_uapi_run_kselftest(test, BLOB(kunit_example_uapi));
> +       else
> +               kunit_skip(test, "CONFIG_KUNIT_UAPI is not enabled");
> +}
> +
>  /*
>   * Here we make a list of all the test cases we want to add to the test =
suite
>   * below.
> @@ -297,6 +311,7 @@ static struct kunit_case example_test_cases[] =3D {
>         KUNIT_CASE(example_priv_test),
>         KUNIT_CASE_PARAM(example_params_test, example_gen_params),
>         KUNIT_CASE_SLOW(example_slow_test),
> +       KUNIT_CASE(example_uapi_test),
>         {}
>  };
>
> diff --git a/lib/kunit/kunit-example-uapi.c b/lib/kunit/kunit-example-uap=
i.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..4ce657050dd4a576632a41ca0=
309c4cb5134ce14
> --- /dev/null
> +++ b/lib/kunit/kunit-example-uapi.c
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * KUnit Userspace example test.
> + *
> + * Copyright (C) 2025, Linutronix GmbH.
> + * Author: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> + *
> + * This is *userspace* code.
> + */
> +
> +#include "../../tools/testing/selftests/kselftest.h"
> +
> +int main(void)
> +{
> +       ksft_print_header();
> +       ksft_set_plan(4);
> +       ksft_test_result_pass("userspace test 1\n");
> +       ksft_test_result_pass("userspace test 2\n");
> +       ksft_test_result_skip("userspace test 3: some reason\n");
> +       ksft_test_result_pass("userspace test 4\n");
> +       ksft_finished();
> +}
>
> --
> 2.49.0
>

--0000000000004e1fbf0637fdc260
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
0TANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgBKYtzZEa4Ddg4+3QCmnZ1mh5rwLd
AZafAWLn84sKTGowGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjUw
NjIwMDk0ODA2WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcN
AQEBBQAEggEAkO/uXk7By+DTBuP3+z/H9J2VjZMPjifQSGosbr4ua+g3dIf5YVQSMtXLiSvWHKqe
fGh/XxB43pw0sxKR5Zv36amn3S4Ty9yFa/SGM21ajxnTxf/qmtAYGijeR5G3rkC9jRsXmgZNys9m
VbwJEId29GCVKjgE7Zp7qcJGraFh529WnfY6nzWEyoicbO3P0UJ2wtCRU0PKC4V5Q+T3B2rnL4pG
b2Ef2bJKNVaWM4ahgBY1ibDzEadfaHhOUJ1RgBXDfsAmeOSg3/+DQIblabOf/09+j1ThpG2Ho2/h
4jENXtPe/GivL0YPpKjsHaGUOdrDL9mE5qKfO6Mvb8aQXmTmQg==
--0000000000004e1fbf0637fdc260--


Return-Path: <linux-kbuild+bounces-7822-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 665E2AF0588
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 23:22:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B2A4481775
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 21:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E9A280025;
	Tue,  1 Jul 2025 21:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dwelXPZw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD8B266560
	for <linux-kbuild@vger.kernel.org>; Tue,  1 Jul 2025 21:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751404941; cv=none; b=h5XA6gcHAF+xbxse+dVMsaZPr39vTWzHJuyyTTFQlx7IIjNNjeqI5uh9UZK66+Yinmi4B0Ny6wSL73A0abOwjHrQwVU4C+AIOUgkzJjqK5pSibj1cncsPnkeB8gGQxfTkJ9mrkLaJ5Km/PucX8MpiA16LI+hHfsL26ckxk7xcew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751404941; c=relaxed/simple;
	bh=IQsUpICLC0Qn6KFzSllS3OJTDp11NskuLuL9MVU2vEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MMcxeIVBcJTA1j8bry+32EXGEQ+IgJmeo3HXU+O4qP2Y+WmQIXYN0F8/ws15bOeQwHKVe48lMs6jdyhZPOguinGbp34pBWxX7XHOAewV1gU+PKcL96WeKVHh/MPwdlH9CHNI2PCmHKzc4b2uUCWxru6NeTNoQfOZ2qkRlCD46JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dwelXPZw; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7d402c901cbso560678685a.3
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Jul 2025 14:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751404938; x=1752009738; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHboM4UpkCkMBxv0QKQdIr00wQYxWyHLFiPmTEgGje8=;
        b=dwelXPZwdzxdNgkLjbtauFbzh8zsySzD1594E1GDlKTEYIQsS3Oq0quNbhNhD2+PtK
         3XYN2VT5s9Z5d2l1kmsc4Aw5SLlX2bkKhum77I0T3lIQ6KmcgAWobHNMkYJr9S5xEFL7
         r6NaTKyXX6q2R3/vtzv0nn8uU1eqYXvuvrzMGFzxMkKkPAdoSUTfZcwOxGZkE5jfdXj6
         xN255gy61s0cT/FEn9pK3CXEx7WAaK/V6lNHJTne1qjj5e4RYTRUUXR3su3Yhi/ZNrxb
         fV1d2R1o+rs6WKBXcVN4Z6oJfgJVbUZRlLRIfehwzGoptU0pan0AuRFgZHvLS7Sh0898
         aBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751404938; x=1752009738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EHboM4UpkCkMBxv0QKQdIr00wQYxWyHLFiPmTEgGje8=;
        b=KBZD9GNNs1t09z5ve66jcGVkbRzaxvJzndSCLCh4gzkT0j55xOfbYUVEaV8UoFbPRN
         35U3vzwunZdqgPiqr0UatT7+xpoLpJ/hs/PhpHCyhVBs/ee748FpLHUgnULMfdvqnwru
         sAB9R38cgYArSJgOke37yz+WWWROxNovrDdPO2EjNyL11PhyRE0V+DaMZB0kH2/zJT3E
         golP1XLOSTPRnQyV0Eokhp/nUNWYiv335DF3akYs4kwBhghPjm/LOE1VGorEdvgkioU+
         NYn3nDtIxL1MWLGRNbxjudqqDpBTfPYwMtFJ3PHoCVJRHDo4MJkQL3CUh/TtAbkD2W3f
         RV8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUY3G7m87lxGkRR6D+NjIy8Axkw//wAmpxYFdsXavH9PFMud/4BeQKTZplLU+BZsEJPhC6vut1rNZ71gbU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcVNnSMV92Yuz4XpPEe3cOcMc5pD+1co9cDJz3BK0oKXKcDmJk
	4qaHUClQJ91+FgLCixvx4v0V2DrVlWVwljzSXxYhvvYy1JgYrldjBAuXIgrS37gvmqglZDvWDlN
	0WwfaNKTa2zDVA0OW2AM3DP/T3zDGo8vwfV7RLGBj
X-Gm-Gg: ASbGnctFPKwu+3N7Lf9fcJKA2G1Tt8pr9QyHQbsdf1ezocVnTE1OqjY/jcyJHPxCy4Y
	MXO+NEXUfW6sj3yg7OypzrLv85wf3MTjTK39vTf4+EIzmTcS35unhiI1NUoEg5dw+ZcGMna3Fj6
	NyxjkHkn6XL8wQSdSnefQLztzdTUHu6+uPfBEuoMJPjiT0S1K91fiYgMNfTDuEOo+0x9uoYs8uA
	AZSr0YHptiX
X-Google-Smtp-Source: AGHT+IEISF1QT4Q3DhFyDLlEp2grcYtzw1GO9CPfuuylOwB608K+J/Xck3XOEu6IYHeQRTW4WmPjWPyLFdsrU12p1QI=
X-Received: by 2002:a05:620a:d86:b0:7ce:e010:88b9 with SMTP id
 af79cd13be357-7d5c4687e50mr74973985a.13.1751404938244; Tue, 01 Jul 2025
 14:22:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626-kunit-kselftests-v4-0-48760534fef5@linutronix.de> <20250626-kunit-kselftests-v4-9-48760534fef5@linutronix.de>
In-Reply-To: <20250626-kunit-kselftests-v4-9-48760534fef5@linutronix.de>
From: Rae Moar <rmoar@google.com>
Date: Tue, 1 Jul 2025 17:22:07 -0400
X-Gm-Features: Ac12FXwuhX6Y-a6woLFeyYnBFFiy1ubYG3C7qlWEGs2OnKsfK-jEArzFm1EN8hs
Message-ID: <CA+GJov7HN_HTVOygyF6SW12DeghW6BYc4KxEz8Ktub=QBqv0oQ@mail.gmail.com>
Subject: Re: [PATCH v4 09/15] kunit: tool: Parse skipped tests from kselftest.h
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 2:10=E2=80=AFAM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> Skipped tests reported by kselftest.h use a different format than KTAP,
> there is no explicit test name. Normally the test name is part of the
> free-form string after the SKIP keyword:
>
>         ok 3 # SKIP test: some reason
>
> Extend the parser to handle those correctly. Use the free-form string as
> test name instead.

Hello!

I am happy to see that the kunit_parser will be used to parse
kselftest.h patches!

This patch looks pretty good to me! However, I do have one concern
where it does cause the parser to break.

Thanks!
-Rae

>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> Reviewed-by: David Gow <davidgow@google.com>
> ---
>  tools/testing/kunit/kunit_parser.py                             | 8 ++++=
+---
>  tools/testing/kunit/test_data/test_is_test_passed-kselftest.log | 3 ++-
>  2 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/tools/testing/kunit/kunit_parser.py b/tools/testing/kunit/ku=
nit_parser.py
> index 2478beb28fc3db825855ad46200340e884da7df1..4599d23c79b79f0e219d655c7=
053c8c3b34f8152 100644
> --- a/tools/testing/kunit/kunit_parser.py
> +++ b/tools/testing/kunit/kunit_parser.py
> @@ -352,9 +352,9 @@ def parse_test_plan(lines: LineStream, test: Test) ->=
 bool:
>         lines.pop()
>         return True
>
> -TEST_RESULT =3D re.compile(r'^\s*(ok|not ok) ([0-9]+) (- )?([^#]*)( # .*=
)?$')
> +TEST_RESULT =3D re.compile(r'^\s*(ok|not ok) ([0-9]+)? ?(- )?([^#]*)( # =
.*)?$')
>
> -TEST_RESULT_SKIP =3D re.compile(r'^\s*(ok|not ok) ([0-9]+) (- )?(.*) # S=
KIP(.*)$')
> +TEST_RESULT_SKIP =3D re.compile(r'^\s*(ok|not ok) ([0-9]+)? ?(- )?(.*) #=
 SKIP ?(.*)$')

My concern with this patch is that this makes the test number optional
([0-9]+) -> ([0-9]+)? for both the test result regex matches. But if I
do pass in KTAP containing a line where the test number is missing, it
causes the parser to crash because other lines of the code rely on the
match with the test number.

I would prefer if we keep the test number as required. This is
integral to the KTAP specification and seems to be largely shared by
different frameworks test output.

>
>  def peek_test_name_match(lines: LineStream, test: Test) -> bool:
>         """
> @@ -379,6 +379,8 @@ def peek_test_name_match(lines: LineStream, test: Tes=
t) -> bool:
>         if not match:
>                 return False
>         name =3D match.group(4)
> +       if not name:
> +               return False
>         return name =3D=3D test.name
>
>  def parse_test_result(lines: LineStream, test: Test,
> @@ -416,7 +418,7 @@ def parse_test_result(lines: LineStream, test: Test,
>
>         # Set name of test object
>         if skip_match:
> -               test.name =3D skip_match.group(4)
> +               test.name =3D skip_match.group(4) or skip_match.group(5)
>         else:
>                 test.name =3D match.group(4)
>
> diff --git a/tools/testing/kunit/test_data/test_is_test_passed-kselftest.=
log b/tools/testing/kunit/test_data/test_is_test_passed-kselftest.log
> index 65d3f27feaf22a3f47ed831c4c24f6f11c625a92..30d9ef18bcec177067288d524=
2771236f29b7d56 100644
> --- a/tools/testing/kunit/test_data/test_is_test_passed-kselftest.log
> +++ b/tools/testing/kunit/test_data/test_is_test_passed-kselftest.log
> @@ -1,5 +1,5 @@
>  TAP version 13
> -1..2
> +1..3
>  # selftests: membarrier: membarrier_test_single_thread
>  # TAP version 13
>  # 1..2
> @@ -12,3 +12,4 @@ ok 1 selftests: membarrier: membarrier_test_single_thre=
ad
>  # ok 1 sys_membarrier available
>  # ok 2 sys membarrier invalid command test: command =3D -1, flags =3D 0,=
 errno =3D 22. Failed as expected
>  ok 2 selftests: membarrier: membarrier_test_multi_thread
> +ok 3 # SKIP selftests: membarrier: membarrier_test_multi_thread
>
> --
> 2.50.0
>


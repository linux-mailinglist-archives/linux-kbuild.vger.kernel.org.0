Return-Path: <linux-kbuild+bounces-6132-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A615CA60662
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Mar 2025 01:04:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04BCB3BCEF5
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Mar 2025 00:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8412E3368;
	Fri, 14 Mar 2025 00:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="taviz52E"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4AC79F5;
	Fri, 14 Mar 2025 00:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741910669; cv=none; b=ZIh4SGyEF1+lLRpxcELOqlNvijaebs/81FOXNcEUJ6kMJ+wGuKDfr3MqkID7KmWwXWGMFYOIKM2nLXfBc73bDVYTqlH7GTZOHU49xKfgmoiGCpTTGRrVw9t2S02Of9Im8pKi9hf85waZe3PtV7I3WBkBDLPKA70znEz2mRFCAzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741910669; c=relaxed/simple;
	bh=iy+/mlqotFK2+b4LNmaNTDTHCIY1kqn2/OKiI6vljG4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Wfv2qxqcmQSwglNitYlDpNlqUkJIb4Kis94ieL35TBU/IA0/8unWQe+n9qA9J7ozytNRwlc/JkS0UyVLCzaIkl1XxJAot+QqAqnawf0hQUT0MnTN5Kcl9db6Cj7jMAG9YJWkKn1C1574jLpx4PnZloMdDkk38yAkno5zOzV7PFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=taviz52E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CB50C4CEEE;
	Fri, 14 Mar 2025 00:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741910668;
	bh=iy+/mlqotFK2+b4LNmaNTDTHCIY1kqn2/OKiI6vljG4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=taviz52EpSNtJVagcI+yCCzKxm6FB4u4RfEbyIqy1BLal+gFZD2oMKObljY1aoCPx
	 IBPkTHn2SC6TmJZgZmH0s/gXFH9PINYlc7Aq9beg6qTsRUp0z1jnHGyJjyNrZKYSJo
	 wCGiHFon2jtd4tS+c+aBCufo5qPL7FB1zut4Zn3yuwxbuz2sE8seUrVRwXuxJIpknO
	 c3Jahtu2V758ParqSaNmFILHgs4wGwPMjiVrkFzfW9bbjTm1GIhimQ2NPAOvTIw0ky
	 ZZSJOwcTg1qyIFL1Bsr3foy05TYgfJABQshAlOFIp+eVaITP5YXeuLtISG++vm6zmu
	 h57x+8LIv8AWQ==
Date: Thu, 13 Mar 2025 17:04:24 -0700
From: Kees Cook <kees@kernel.org>
To: Marco Elver <elver@google.com>
CC: Justin Stitt <justinstitt@google.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Miguel Ojeda <ojeda@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Hao Luo <haoluo@google.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 linux-hardening@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-kbuild@vger.kernel.org, Bill Wendling <morbo@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Tony Ambardar <tony.ambardar@gmail.com>,
 Alexander Potapenko <glider@google.com>, Jan Hendrik Farr <kernel@jfarr.cc>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_1/3=5D_ubsan/overflow=3A_Rework_integer_?=
 =?US-ASCII?Q?overflow_sanitizer_option_to_turn_on_everything?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CANpmjNOHSanxX7EyXhia4AuVd+6q5v1mXQMTM_k0Rj20P_ASAA@mail.gmail.com>
References: <20250307040948.work.791-kees@kernel.org> <20250307041914.937329-1-kees@kernel.org> <CANpmjNOHSanxX7EyXhia4AuVd+6q5v1mXQMTM_k0Rj20P_ASAA@mail.gmail.com>
Message-ID: <2AACDA6E-F7EF-4962-937A-C9511E4E2930@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On March 13, 2025 8:29:29 AM PDT, Marco Elver <elver@google=2Ecom> wrote:
>On Thu, 6 Mar 2025 at 23:19, Kees Cook <kees@kernel=2Eorg> wrote:
>>
>> Since we're going to approach integer overflow mitigation a type at a
>> time, we need to enable all of the associated sanitizers, and then opt
>> into types one at a time=2E
>>
>> Rename the existing "signed wrap" sanitizer to just the entire topic ar=
ea:
>> "integer wrap"=2E Enable the implicit integer truncation sanitizers, wi=
th
>> required callbacks and tests=2E
>>
>> Notably, this requires features (currently) only available in Clang,
>> so we can depend on the cc-option tests to determine availability
>> instead of doing version tests=2E
>>
>> Signed-off-by: Kees Cook <kees@kernel=2Eorg>
>> ---
>> Cc: Justin Stitt <justinstitt@google=2Ecom>
>> Cc: "Gustavo A=2E R=2E Silva" <gustavoars@kernel=2Eorg>
>> Cc: Andrew Morton <akpm@linux-foundation=2Eorg>
>> Cc: Marco Elver <elver@google=2Ecom>
>> Cc: Andrey Konovalov <andreyknvl@gmail=2Ecom>
>> Cc: Andrey Ryabinin <ryabinin=2Ea=2Ea@gmail=2Ecom>
>> Cc: Masahiro Yamada <masahiroy@kernel=2Eorg>
>> Cc: Nathan Chancellor <nathan@kernel=2Eorg>
>> Cc: Nicolas Schier <nicolas@fjasle=2Eeu>
>> Cc: Miguel Ojeda <ojeda@kernel=2Eorg>
>> Cc: Nick Desaulniers <ndesaulniers@google=2Ecom>
>> Cc: Hao Luo <haoluo@google=2Ecom>
>> Cc: Przemek Kitszel <przemyslaw=2Ekitszel@intel=2Ecom>
>> Cc: linux-hardening@vger=2Ekernel=2Eorg
>> Cc: kasan-dev@googlegroups=2Ecom
>> Cc: linux-kbuild@vger=2Ekernel=2Eorg
>> ---
>>  include/linux/compiler_types=2Eh  |  2 +-
>>  kernel/configs/hardening=2Econfig |  2 +-
>>  lib/Kconfig=2Eubsan               | 23 +++++++++++------------
>>  lib/test_ubsan=2Ec                | 18 ++++++++++++++----
>>  lib/ubsan=2Ec                     | 28 ++++++++++++++++++++++++++--
>>  lib/ubsan=2Eh                     |  8 ++++++++
>>  scripts/Makefile=2Elib            |  4 ++--
>>  scripts/Makefile=2Eubsan          |  8 ++++++--
>>  8 files changed, 69 insertions(+), 24 deletions(-)
>>
>> diff --git a/include/linux/compiler_types=2Eh b/include/linux/compiler_=
types=2Eh
>> index f59393464ea7=2E=2E4ad3e900bc3d 100644
>> --- a/include/linux/compiler_types=2Eh
>> +++ b/include/linux/compiler_types=2Eh
>> @@ -360,7 +360,7 @@ struct ftrace_likely_data {
>>  #endif
>>
>>  /* Do not trap wrapping arithmetic within an annotated function=2E */
>> -#ifdef CONFIG_UBSAN_SIGNED_WRAP
>> +#ifdef CONFIG_UBSAN_INTEGER_WRAP
>>  # define __signed_wrap __attribute__((no_sanitize("signed-integer-over=
flow")))
>>  #else
>>  # define __signed_wrap
>> diff --git a/kernel/configs/hardening=2Econfig b/kernel/configs/hardeni=
ng=2Econfig
>> index 3fabb8f55ef6=2E=2Edd7c32fb5ac1 100644
>> --- a/kernel/configs/hardening=2Econfig
>> +++ b/kernel/configs/hardening=2Econfig
>> @@ -46,7 +46,7 @@ CONFIG_UBSAN_BOUNDS=3Dy
>>  # CONFIG_UBSAN_SHIFT is not set
>>  # CONFIG_UBSAN_DIV_ZERO is not set
>>  # CONFIG_UBSAN_UNREACHABLE is not set
>> -# CONFIG_UBSAN_SIGNED_WRAP is not set
>> +# CONFIG_UBSAN_INTEGER_WRAP is not set
>>  # CONFIG_UBSAN_BOOL is not set
>>  # CONFIG_UBSAN_ENUM is not set
>>  # CONFIG_UBSAN_ALIGNMENT is not set
>> diff --git a/lib/Kconfig=2Eubsan b/lib/Kconfig=2Eubsan
>> index 1d4aa7a83b3a=2E=2E63e5622010e0 100644
>> --- a/lib/Kconfig=2Eubsan
>> +++ b/lib/Kconfig=2Eubsan
>> @@ -116,21 +116,20 @@ config UBSAN_UNREACHABLE
>>           This option enables -fsanitize=3Dunreachable which checks for=
 control
>>           flow reaching an expected-to-be-unreachable position=2E
>>
>> -config UBSAN_SIGNED_WRAP
>> -       bool "Perform checking for signed arithmetic wrap-around"
>> +config UBSAN_INTEGER_WRAP
>> +       bool "Perform checking for integer arithmetic wrap-around"
>>         default UBSAN
>>         depends on !COMPILE_TEST
>> -       # The no_sanitize attribute was introduced in GCC with version =
8=2E
>> -       depends on !CC_IS_GCC || GCC_VERSION >=3D 80000
>>         depends on $(cc-option,-fsanitize=3Dsigned-integer-overflow)
>> -       help
>> -         This option enables -fsanitize=3Dsigned-integer-overflow whic=
h checks
>> -         for wrap-around of any arithmetic operations with signed inte=
gers=2E
>> -         This currently performs nearly no instrumentation due to the
>> -         kernel's use of -fno-strict-overflow which converts all would=
-be
>> -         arithmetic undefined behavior into wrap-around arithmetic=2E =
Future
>> -         sanitizer versions will allow for wrap-around checking (rathe=
r than
>> -         exclusively undefined behavior)=2E
>> +       depends on $(cc-option,-fsanitize=3Dunsigned-integer-overflow)
>> +       depends on $(cc-option,-fsanitize=3Dimplicit-signed-integer-tru=
ncation)
>> +       depends on $(cc-option,-fsanitize=3Dimplicit-unsigned-integer-t=
runcation)
>
>Can these be in 1 cc-option? I know it might look slightly more ugly,
>but having 3 different ones will shell out to the compiler 3 times,
>which is a little less efficient=2E At some point it might noticeably
>increase the build initialization latency=2E

Yeah, good point=2E I could probably just test the most recently added opt=
ion, as it implies all the rest, too=2E I'll send an update!

-Kees


--=20
Kees Cook


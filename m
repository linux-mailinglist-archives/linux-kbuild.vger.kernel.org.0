Return-Path: <linux-kbuild+bounces-3470-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AAC9705BE
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Sep 2024 10:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E2B2282D9F
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Sep 2024 08:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D8D449634;
	Sun,  8 Sep 2024 08:21:03 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3641E25761;
	Sun,  8 Sep 2024 08:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725783663; cv=none; b=LOUtXkhjVj/R989sMR/duDeYDbVbyphPVCMLFjABQlT2u1CvaCKDd9zi3bQ5OFBMyMFRtDl+WlI+4IuBycjUhuJRyvBHcCzvpwYIxJz62/Zuo6vnBhnKmxZYafIHwitnEwt4QAkT6s6vY8UYICTYXYXqBpWEgNvCk2cuKn69Wv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725783663; c=relaxed/simple;
	bh=PTbvdXCNAdnt2fG2xjYbF+2g2dpemJHQFiO9iHVSl7I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VG47NTljQ3UR3WBBSZYiPZR90faZwd4D3qC0zxxgxa1dn0VE9OkK2NV9ooIHv1e8cL2TDHR7kKJvkTMNpHyC8CswZKjs40W26E62ZID+MFMmmVacL2JAWodqGkyQekgb8B6aKrQmws1X7B49AZingO0MMk2frikRpNoBdJ3QMRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,  Nicolas Schier
 <nicolas@fjasle.eu>,  linux-kbuild@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fixdep: handle short reads in read_file
In-Reply-To: <CAK7LNARW8CgOXFLtavR9BQMdDqASDTBLMij23b8Srn5Krd32Ug@mail.gmail.com>
	(Masahiro Yamada's message of "Sun, 8 Sep 2024 08:48:48 +0900")
Organization: Gentoo
References: <3132727fea08e81e834104761b5a5630d337340a.1725636560.git.sam@gentoo.org>
	<CAK7LNATeuwaO8AvAqmz_4hyb5vjFnL-jhxbXv6_KoCTZbsS86A@mail.gmail.com>
	<87y143ixdb.fsf@gentoo.org> <87seubioi4.fsf@gentoo.org>
	<CAK7LNARW8CgOXFLtavR9BQMdDqASDTBLMij23b8Srn5Krd32Ug@mail.gmail.com>
Date: Sun, 08 Sep 2024 09:20:57 +0100
Message-ID: <87h6aqo8t2.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Masahiro Yamada <masahiroy@kernel.org> writes:

> On Sat, Sep 7, 2024 at 10:26=E2=80=AFPM Sam James <sam@gentoo.org> wrote:
>>
>> Sam James <sam@gentoo.org> writes:
>>
>> > Masahiro Yamada <masahiroy@kernel.org> writes:
>> >
>> >> On Sat, Sep 7, 2024 at 12:29=E2=80=AFAM Sam James <sam@gentoo.org> wr=
ote:
>> >
>> > Hi Masahiro,
>> >
>> >>>
>> >>> 50% or so of kernel builds within our package manager fail for me wi=
th
>> >>> 'fixdep: read: success' because read(), for some reason - possibly p=
trace,
>> >>> only read a short amount, not the full size.
>> >>>
>> >>> Unfortunately, this didn't trigger a -Wunused-result warning because
>> >>> we _are_ checking the return value, but with a bad comparison (it's =
completely
>> >>> fine for read() to not read the whole file in one gulp).
>> >>>
>> >>> Fixes: 01b5cbe7012fb1eeffc5c143865569835bcd405e
>> >>
>> >>
>> >> Fixes: 01b5cbe7012f ("fixdep: use malloc() and read() to load dep_file
>> >> to buffer")
>> >>
>> >
>> > Ah, thanks. I'll fix that and send v2 depending on how we decide to mo=
ve
>> > forward wrt below.
>> >
>> >>
>> >> I guess, another approach would be to use fread() instead of read().
>> >>
>> >> Does the attached diff fix the issue too?
>> >>
>> >>
>> >
>> > Unfortunately no. It failed for me in the same way as before :(
>> >
>> > The man page mentions:
>> >> On  success, fread() and fwrite() return the number of items read or
>> >> written. This number equals the number of bytes transferred only when=
 size is 1.
>> >
>> > so I guess it suffers from the same pitfall. I checked POSIX & ISO C a=
s well
>> > which says:
>> >> If a partial element is read, its value is unspecified.
>> > and
>> >> The fread() function shall return the number of elements successfully
>> >> read, which shall be less than nitems only if an error or end-of-file
>> >> is encountered, or size is zero.
>> >
>> > The error reference is kind of mysterious there though.
>> >
>> > It kind of looks like fread *should* work. I'll send this mail and then
>> > think about it a bit later and ask around to see if I'm missing
>> > something obvious?
>>
>> OK, others disagree with my reading of fread and think it is ambiguous.
>>
>> With your patch, I was able to get failures albeit possibly less
>> frequently. I'm trying my patch again in a loop now.
>>
>> >
>> >> [...]
>> >
>> > thanks,
>> > sam
>>
>
>
>
>
>
>
> Your quotation of the POSIX fread() spec:
> (https://pubs.opengroup.org/onlinepubs/000095399/functions/fread.html)
>
>> If a partial element is read, its value is unspecified.
> and
>> The fread() function shall return the number of elements successfully
>> read, which shall be less than nitems only if an error or end-of-file
>> is encountered, or size is zero.
>
>
> I think this is clear enough.
>
>
> The end-of-file should not be encountered, as we check the file
> size in advance.

I believe that it's referring to the number of records, not if you read
*1* record of size N. I looked at the musl and glibc sources and neither
seem to retry partial reads in that case.

I don't see any error indicator set.


Return-Path: <linux-kbuild+bounces-3463-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC79970261
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Sep 2024 15:26:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D49891C21494
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Sep 2024 13:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B75158558;
	Sat,  7 Sep 2024 13:26:17 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550E4A93D;
	Sat,  7 Sep 2024 13:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725715577; cv=none; b=T73e2NurBEfFvoQbeSVwDb8+XS0qMRJvpNvyWVe3MKAyPv4UWVJuLQXMIXcr0Y5Zx7JmYzYm21QeGRLIK/RUCZcUikZBv6cGU0LJt13Hcfos5k735sLlHExD6+KdOGpj5+xMjVHbVpgbV1mb2YmFrVnsyKUhDpthbRPkqcOil+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725715577; c=relaxed/simple;
	bh=rZWlTQC35qWRukStTjw642xQ+iZZzr40en6w7EIDDck=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FETk0rTTeXUkJREpnAT4SUGDsMm6kH1NuC+P0WrjBqTEDi88yprL/coaC8QkPiTBpFMFUrMkvNHW0dGwZGICQcSkaxTvQ2APb0d+tRD44KD4c+fseZa9FCHpV7Pzv4jWYeQ0gBhrK/Ci9sKt0wIiGhPyIwa3zEYreHaty19pFog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,  Nicolas Schier
 <nicolas@fjasle.eu>,  linux-kbuild@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fixdep: handle short reads in read_file
In-Reply-To: <87y143ixdb.fsf@gentoo.org> (Sam James's message of "Sat, 07 Sep
	2024 11:14:40 +0100")
Organization: Gentoo
References: <3132727fea08e81e834104761b5a5630d337340a.1725636560.git.sam@gentoo.org>
	<CAK7LNATeuwaO8AvAqmz_4hyb5vjFnL-jhxbXv6_KoCTZbsS86A@mail.gmail.com>
	<87y143ixdb.fsf@gentoo.org>
Date: Sat, 07 Sep 2024 14:26:11 +0100
Message-ID: <87seubioi4.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sam James <sam@gentoo.org> writes:

> Masahiro Yamada <masahiroy@kernel.org> writes:
>
>> On Sat, Sep 7, 2024 at 12:29=E2=80=AFAM Sam James <sam@gentoo.org> wrote:
>
> Hi Masahiro,
>
>>>
>>> 50% or so of kernel builds within our package manager fail for me with
>>> 'fixdep: read: success' because read(), for some reason - possibly ptra=
ce,
>>> only read a short amount, not the full size.
>>>
>>> Unfortunately, this didn't trigger a -Wunused-result warning because
>>> we _are_ checking the return value, but with a bad comparison (it's com=
pletely
>>> fine for read() to not read the whole file in one gulp).
>>>
>>> Fixes: 01b5cbe7012fb1eeffc5c143865569835bcd405e
>>
>>
>> Fixes: 01b5cbe7012f ("fixdep: use malloc() and read() to load dep_file
>> to buffer")
>>
>
> Ah, thanks. I'll fix that and send v2 depending on how we decide to move
> forward wrt below.
>
>>
>> I guess, another approach would be to use fread() instead of read().
>>
>> Does the attached diff fix the issue too?
>>
>>
>
> Unfortunately no. It failed for me in the same way as before :(
>
> The man page mentions:
>> On  success, fread() and fwrite() return the number of items read or
>> written. This number equals the number of bytes transferred only when si=
ze is 1.=20=20
>
> so I guess it suffers from the same pitfall. I checked POSIX & ISO C as w=
ell
> which says:
>> If a partial element is read, its value is unspecified.
> and
>> The fread() function shall return the number of elements successfully
>> read, which shall be less than nitems only if an error or end-of-file
>> is encountered, or size is zero.
>
> The error reference is kind of mysterious there though.
>
> It kind of looks like fread *should* work. I'll send this mail and then
> think about it a bit later and ask around to see if I'm missing
> something obvious?

OK, others disagree with my reading of fread and think it is ambiguous.

With your patch, I was able to get failures albeit possibly less
frequently. I'm trying my patch again in a loop now.

>
>> [...]
>
> thanks,
> sam


Return-Path: <linux-kbuild+bounces-4055-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD2299A14E
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Oct 2024 12:28:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5DC11B21F5D
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Oct 2024 10:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB9B5210C2C;
	Fri, 11 Oct 2024 10:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Fr5pdSLU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C547B20C496;
	Fri, 11 Oct 2024 10:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728642485; cv=none; b=sDqxGNqJTW27VInODumUbSh1MHV3vv5nCREOiM9XGLhVoE/yw5z6eJk2NO9f0b9bWrexCCPB79GVA8J7TTQiJILnDLTM/Yf7M8f/C2suKE42uWIo0ci7pkaxl7SqW3/V50y3JBp+kez9DTQ13ykfpV5cz8c9akWcTXDsnzdMR8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728642485; c=relaxed/simple;
	bh=JAWxdb2054N4vnmVoEksQzgMI3keyHTm3oH2Hvh2fMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zcobt1qu8lq+DVNjmvlYzhtJrkjEW+EScJXD8y2NJ7ow72XP/YbMgryuhtFY8Ld1HB6nKZwTWjMIxUOtSL7nJkaES8i0645Pp8SKoSiqnDMDPpCQokCU4w8wLTJYv8GpD5R2I0aIwb3NUlR5Kd2qLjoJWfThvnKCEoGi694Gwyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Fr5pdSLU; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=yhMkYAxISXGsvtgkvT6WmQHNSFavUtNH55oNonTLR+s=; t=1728642483;
	x=1729074483; b=Fr5pdSLUQtoehp+HsHwjisbMYE/iaJnPxKmv9Qsu4iMcy6Bo0uQtHeuwXbBa/
	0dMgW8K06Cg/1Avx7FTG1q+b1eup1rkqyceCg3zOv7RPbXmemDFVIg8PbAaSPzAe4VgdAf0eD2N/d
	snIfV+YPHtFhB4a3X6oo9Hi39A+SRfM+4js06u5TXvUAXeSz/tAt5H+lkcZVFp+Bijl3xUTqHq0tV
	U1UKkwrAVWc9Xo7bG6TWlm6LOOn3FszxGzU1ez3niFQijMF7AdGcdhfKQA6LwOThAj9eHTfWPML22
	h2lBVM6XLgrF0lBKpq5icAe+UkrkxOa3a5uzTo6VD4l+NvyMEw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1szCsE-0004hg-Vr; Fri, 11 Oct 2024 12:27:55 +0200
Message-ID: <c94590a5-4121-497b-8529-cbab2b01fe51@leemhuis.info>
Date: Fri, 11 Oct 2024 12:27:54 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1] module: sign with sha512 by default to avoid build
 errors
To: Sami Tolvanen <samitolvanen@google.com>
Cc: sedat.dilek@gmail.com, Luis Chamberlain <mcgrof@kernel.org>,
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>,
 linux-modules@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <42aa307d7ffae1851b4a8787f5c276dd0b3beece.1728543368.git.linux@leemhuis.info>
 <b32f1e42-d775-4538-ba36-9e9b906a34e3@leemhuis.info>
 <CA+icZUUgwJWY=PWO5fQPZbUc-q=LkdHXVe4+g-LnXmQfCA3N7Q@mail.gmail.com>
 <CA+icZUX9hrwFXA-6KVT+yZ=-NqyPB=LOKKWSf77-xb32totgHA@mail.gmail.com>
 <a5b3c47e-5f0f-4c0f-8ad9-4fb34d150548@leemhuis.info>
 <CABCJKudayCsPuowkUW7_JV_2HPNp5tf_py6jjDe6Ld7oMai9jg@mail.gmail.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: en-US, de-DE
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 n7RI
In-Reply-To: <CABCJKudayCsPuowkUW7_JV_2HPNp5tf_py6jjDe6Ld7oMai9jg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1728642483;a17e4649;
X-HE-SMSGID: 1szCsE-0004hg-Vr

On 10.10.24 17:52, Sami Tolvanen wrote:

Thx for your feedback!

> On Thu, Oct 10, 2024 at 1:57 AM Thorsten Leemhuis <linux@leemhuis.info> wrote:
>> On 10.10.24 10:42, Sedat Dilek wrote:
>>> On Thu, Oct 10, 2024 at 10:29 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>>>> On Thu, Oct 10, 2024 at 10:19 AM Thorsten Leemhuis <linux@leemhuis.info> wrote:
>>>>> On 10.10.24 09:00, Thorsten Leemhuis wrote:
>
>> P.S.: Vegard Nossum mentioned in the fediverse that I could also solve
>> the problem the patch is about by adding "default MODULE_SIG_SHA512" to
>> the "choice" section; haven't tried that, but that sounds like a better
>> solution. Will likely give it a try, unless someone brings up unwanted
>> side effects this might cause.
> 
> Yes, that would be a much better way to change the default. Overall,
> moving away from SHA-1 seems like a good idea and SHA-512 feels like a
> reasonable choice. Luis, do you see any issues with changing the
> default here?

So, how do I make such a default choice work without breaking the
current magic, which looks like this:

"""
config MODULE_SIG_HASH
	string
	depends on MODULE_SIG || IMA_APPRAISE_MODSIG
	default "sha1" if MODULE_SIG_SHA1
	default "sha256" if MODULE_SIG_SHA256
	default "sha384" if MODULE_SIG_SHA384
	default "sha512" if MODULE_SIG_SHA512
	default "sha3-256" if MODULE_SIG_SHA3_256
	default "sha3-384" if MODULE_SIG_SHA3_384
	default "sha3-512" if MODULE_SIG_SHA3_512
"""

Reordering those did not do the trick. And I suspect adding a

  default "sha512"

would break the magic. Would dropping sha1, sha256 and sha384 from the
list be a middle ground that could work for everyone?

Ciao, Thorsten


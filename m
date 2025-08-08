Return-Path: <linux-kbuild+bounces-8323-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A64B1E101
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Aug 2025 05:30:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A970580872
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Aug 2025 03:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 359AC19DF9A;
	Fri,  8 Aug 2025 03:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WQajeULH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902CF192598
	for <linux-kbuild@vger.kernel.org>; Fri,  8 Aug 2025 03:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754623835; cv=none; b=ReZAiRr6/ei99ccSRGBte4lJ0JJSR4dvjWyejOCTK0FHOH7xYt0zctAvO1LBoXJs2mFX1iZvqM4UhQDB7BUgZFFVqtoM8WkwvhkVh5+t2a2+HRh9jFdBpomFIHNGyR6z//4SURAfxjPpGerLL2L7vse7akem6YcgDc89sr7qO8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754623835; c=relaxed/simple;
	bh=1u86JEYmH4iLpCkPL+nZss6Mxa0Oh9TLRKjBdt0WhJY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=JdQIL/iXEkLW7c8aPPcrnPa4CiR5YMcL2jnZWyR8uKqquGSvpfFxs13Ml5zcCWFFWqVUdCP396A84tfHwyONzXi7QBlBqVaOYMCiSkWHerPTCZPCUR4VXNeRXK7DSR+pN2K4CSIcSyALbTqRQRtxnj9pOo+w4yxiig/94zD+L24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WQajeULH; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=tsa7BllNnsMorSquuEEnlxdzMuSJ2Mx5CV7YVmNpj2I=; b=WQajeULHOy0OT1eFKdLRZ2U602
	9hWpXS5ThnQEC8nuvAucItON7/9+QfvaSUCp0e8mTLQn54g/xt154Mev9drK16aXziTlwzuqxKWYx
	+dwfyQXQa7j42knSZ1OzlONrfpHki584ALj1uU9WxV5zx0tcFTPVQLx7+dyFTPWso8mAui3+sVUuF
	c6oYOJOfWKIUo4KhWKW5jUC3gDW11HaUoomN1bnLaQRCn3bdDRpD8QwftQE2RDmZfTFatUY8XLup/
	8DQzKdKXEt/HliDLAqD+dkFByLpKNlrkoCGHweqdrsaIaj6GXYGV5eWWqdIa8Jb+KKnvb1PxbdioH
	9RcoIMew==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukDoP-00000001vMd-16bG;
	Fri, 08 Aug 2025 03:30:33 +0000
Message-ID: <e7a71f76-ce38-46af-bc81-997f796ac911@infradead.org>
Date: Thu, 7 Aug 2025 20:30:32 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Unable to build custom amd64 module.
From: Randy Dunlap <rdunlap@infradead.org>
To: "David F." <df7729@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <CAGRSmLvRaFfLG-ksN=WHe3FrH4DOrcJud5BZynGhsrYc8c28ww@mail.gmail.com>
 <bf26afd4-7c4d-47ce-b294-093c15e31ec0@infradead.org>
 <CAGRSmLuViYdzsoPFtZ6PE9_Bo0VZB0Ccbs5c7Sy-bpct9eXr3g@mail.gmail.com>
 <CAGRSmLsxTH_sq6Vm0A_v6m0u2USrG981NhBoyJCS1hwY+bENCg@mail.gmail.com>
 <4cdde960-f897-4a17-8a5b-18fbbced4da1@infradead.org>
Content-Language: en-US
In-Reply-To: <4cdde960-f897-4a17-8a5b-18fbbced4da1@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/7/25 8:24 PM, Randy Dunlap wrote:
> 
> 
> On 8/7/25 8:02 PM, David F. wrote:
>> Okay, I changed out objtool to be a script that pauses, now I got my
>> .o file and ran that command to create the .od file.   There was no
>> "text.0x23f4" but I did find a line "23f4" and it's calling (callq) in
>> to a custom asm module (in .o / .lib sense), that does have offsets
>> within the function that are called/jumped to.  So this is okay, is
>> there a way to disable that check without the asm source code having
>> to be changed somehow?   I can't rebuild that .asm file (.s in the
>> linux world IIFC).
>>

So is the callq to the beginning of a function?
Do you even have the source code for the asm module
or just a binary?


> 
> Please don't top-post.
> 
>> On Thu, Aug 7, 2025 at 7:16 PM David F. <df7729@gmail.com> wrote:
>>>
>>> Thanks, I used the OBJTOOL_VERBOSE=1  on the make and got this extra
>>> bit of information:
>>>
>>> mydriver.o: warning: objtool: .text+0x23f4: unannotated intra-function call
>>> mydriver.o: error: objtool [builtin-check.c:220]: copy_file: sendfile
>>> failed: Invalid argument
>>>
>>> The .o file still got deleted.
>>>
>>> I may have to go into the makefile in the kernel and pause where
>>> objtool is run  ?
>>>
>>> On Wed, Aug 6, 2025 at 10:54 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 8/6/25 9:37 PM, David F. wrote:
>>>>> Hello,
>>>>>
> 
> [snip]
> 
>>>>> Any ideas how to work around this or find the problem.   The error
>>>>> code doesn't give me a clue of what it is:
>>>>
>>>> It does a little bit. Also read tools/objtool/Documentation/objtool.txt
>>>> in the kernel source tree: search for "unannotated".
> The Documentation file (above) tells you how to disable the warning.

I hope that you can test your final module really well so that this 
"unannotated intra-function call" doesn't cause problems when it is executed.

But if you want to ignore the warning, that's up to you.

-- 
~Randy



Return-Path: <linux-kbuild+bounces-8322-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B221B1E0F3
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Aug 2025 05:24:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08EA518A551D
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Aug 2025 03:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054551A83ED;
	Fri,  8 Aug 2025 03:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="1ZvHtVQl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7441AC88A
	for <linux-kbuild@vger.kernel.org>; Fri,  8 Aug 2025 03:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754623464; cv=none; b=gaoAFDWz1ALWq7pByn+N+CT8H8npIrPdLmxijbdyaWCdvcHVyXeySYl/kRrzj+QUZ8gr7+tOUYTZuqrqgqo+iO7s+i63GwLUdAG30EzTG8+6rkyg7ejS9+R7j23ZXCvTMKTmdlVD9DLdgaFUCnNOm8SXn76PWQvOFWRg5Tou8U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754623464; c=relaxed/simple;
	bh=trBQKwpgQffzAz0+nwXqmpyLexD4/+m3UvTEzxKBD4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K/Pct+qM7crNYKLbQQudyXXf7nD7OlD0Ca86cju+DOef7mc6SlyfI1Gbk5v1IOt9zbLQ8AfEZlkBIB9pBwXzbQ7ek3yPahxvyhB+UmGf5nOBjrWAXJ4fSkM9/15XnFjug896ojvSTeG/wH2K91OV/2bG2BvzqOFlDv+mx85o/70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=1ZvHtVQl; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=sF9dBRDSZZX+h01ah6P/Fs9vhLksveNhMNEj8brQdOE=; b=1ZvHtVQlB+Nr0drLLT/e1ZhUjL
	K74Of0YM0lbWUOvw5Uytx9cchzofucqLDpDj9fHzClPHtAmumfMTKiDYfgsoR+ohznihOOo67MUvX
	QXv34FB5c9+WRYU+sDlJcC/nVSXBWwpo4Lxl9FhBPn0pmWfoIrfOWQ0qrgEKcHgm94OlRVUL238Y7
	YqPvC16FFTqdUXj/XjNL8q8HMeOu2fpRkB1OSVVVhJSBY0F07K4hrJvIoHkI6siz5XgDBn4Z4v+gi
	YJojWDMgCk8zEMHlDU+qZyMRBp5NgC/xRO8GDH5T2lHQd1bGmQcBEOZsR2E9yjZTagxqZP932a6WK
	/gtZtSPg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukDiQ-00000001v2n-1rQb;
	Fri, 08 Aug 2025 03:24:22 +0000
Message-ID: <4cdde960-f897-4a17-8a5b-18fbbced4da1@infradead.org>
Date: Thu, 7 Aug 2025 20:24:22 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Unable to build custom amd64 module.
To: "David F." <df7729@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <CAGRSmLvRaFfLG-ksN=WHe3FrH4DOrcJud5BZynGhsrYc8c28ww@mail.gmail.com>
 <bf26afd4-7c4d-47ce-b294-093c15e31ec0@infradead.org>
 <CAGRSmLuViYdzsoPFtZ6PE9_Bo0VZB0Ccbs5c7Sy-bpct9eXr3g@mail.gmail.com>
 <CAGRSmLsxTH_sq6Vm0A_v6m0u2USrG981NhBoyJCS1hwY+bENCg@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAGRSmLsxTH_sq6Vm0A_v6m0u2USrG981NhBoyJCS1hwY+bENCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/7/25 8:02 PM, David F. wrote:
> Okay, I changed out objtool to be a script that pauses, now I got my
> .o file and ran that command to create the .od file.   There was no
> "text.0x23f4" but I did find a line "23f4" and it's calling (callq) in
> to a custom asm module (in .o / .lib sense), that does have offsets
> within the function that are called/jumped to.  So this is okay, is
> there a way to disable that check without the asm source code having
> to be changed somehow?   I can't rebuild that .asm file (.s in the
> linux world IIFC).
> 

Please don't top-post.

> On Thu, Aug 7, 2025 at 7:16 PM David F. <df7729@gmail.com> wrote:
>>
>> Thanks, I used the OBJTOOL_VERBOSE=1  on the make and got this extra
>> bit of information:
>>
>> mydriver.o: warning: objtool: .text+0x23f4: unannotated intra-function call
>> mydriver.o: error: objtool [builtin-check.c:220]: copy_file: sendfile
>> failed: Invalid argument
>>
>> The .o file still got deleted.
>>
>> I may have to go into the makefile in the kernel and pause where
>> objtool is run  ?
>>
>> On Wed, Aug 6, 2025 at 10:54 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>>
>>> Hi,
>>>
>>> On 8/6/25 9:37 PM, David F. wrote:
>>>> Hello,
>>>>

[snip]

>>>> Any ideas how to work around this or find the problem.   The error
>>>> code doesn't give me a clue of what it is:
>>>
>>> It does a little bit. Also read tools/objtool/Documentation/objtool.txt
>>> in the kernel source tree: search for "unannotated".
The Documentation file (above) tells you how to disable the warning.


-- 
~Randy



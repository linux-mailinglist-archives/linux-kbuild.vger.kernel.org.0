Return-Path: <linux-kbuild+bounces-8310-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 293C1B1D233
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Aug 2025 07:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE2A93B9A0B
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Aug 2025 05:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D40101E520C;
	Thu,  7 Aug 2025 05:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="O0/KP3xX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B05214A6A
	for <linux-kbuild@vger.kernel.org>; Thu,  7 Aug 2025 05:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754546049; cv=none; b=NwBb7C6oMOh47AOX9T5p+R4yOk+Ze+Cz7LgoQxrgQq1+6rtztX52JIKfIJeMymu5ztmapXu5jhktS01cGpE8h/1dSvdp1RuBQJfStZSMmt0Ey3KLHcHuuKvBselxhVoUSR//iEQyaaXcthOe+D/mqZ9PITD5u0gea15Is8YduME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754546049; c=relaxed/simple;
	bh=aQs2zbmWB5MUeJPv8qdQEJeH+BA9lh3OyPsZZ3eKE/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ac5KXbD85YBinKiFRk/B0Hg0omjz8MJp161o58EmZZcbFA2VJjBqjhMgJnlZlex5DR3IXjd+cpIUw9QYeKkMZSFzNgKqCQKwsfACr0yehTQg9qH+XNXwhGqPBjaJorwM4pKRVeFNUCwBwtMMckKgrsnDxneOOX+pvzNUKc/suLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=O0/KP3xX; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=rpZyKtbo3DFRupdqKlktbUcTrHk4QsGIQrj4xC5nPXQ=; b=O0/KP3xXKUQOJgIQoyIyNbxuL4
	ANjjYhvZyukW+YpMhhEdk2SUaZUCIHhPUK4PYmUjhYDmpn37DVpg3AynLOSc+gMg16qkejkAhWWA3
	HGVRp2EIWQdi1xfhKE+sJYpkvN/2Uy9gFt8CJEf27CCh9EwUN58jYiPhk0FSYjxRMafE8gi8AGqPh
	iz3wWJTSfFFCNrbt+2Og903PqTgevi6Zc58CUeoDwzSuUAmJYVb2mf0zaUfT8jpJ8Bxc3VWsh0LM0
	UbjVwUFByaUL1gNRkSFqhEkThK1E4N8hn611rJCKqzXVdNJDxjvc5sFwOIU3phuvLtuucTE7Z4Xob
	QV55rXcg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujtZl-0000000HKgr-38Yd;
	Thu, 07 Aug 2025 05:54:05 +0000
Message-ID: <bf26afd4-7c4d-47ce-b294-093c15e31ec0@infradead.org>
Date: Wed, 6 Aug 2025 22:54:05 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Unable to build custom amd64 module.
To: "David F." <df7729@gmail.com>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <CAGRSmLvRaFfLG-ksN=WHe3FrH4DOrcJud5BZynGhsrYc8c28ww@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAGRSmLvRaFfLG-ksN=WHe3FrH4DOrcJud5BZynGhsrYc8c28ww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/6/25 9:37 PM, David F. wrote:
> Hello,
> 
> The last modules I built was from 6.6.x.  I'm trying to build for
> 6.15.x but it's failing for the amd64 version.    I'm building both a
> 686 and amd64 version of the module (driver) using the scripts I've
> used a long time.   The system is Devuan Chimaera 686 version.   The
> 686 module builds fine, but the amd64 get to the point shown below and
> fails.   Does it have to do with that warning?  What would cause that
> in the amd64 version but not the 686 version (everything is compiled
> from the same source).
> 
> Any ideas how to work around this or find the problem.   The error
> code doesn't give me a clue of what it is:

It does a little bit. Also read tools/objtool/Documentation/objtool.txt
in the kernel source tree: search for "unannotated".

> 
>   LD [M]  mydriver.o
> mydriver.o: warning: objtool: .text+0x23f4: unannotated intra-function call

(1) prevent "Deleting file 'mydriver.o'" below (I don't know what is doing that.)

(2) run
    $ objdump -CDlSxp -m i386:x86-64 mydriver.o >mydriver.od
(I have never used "-m i386:x86-64"; that's just what I found on the web.)

(3) Edit/search mydriver.od:
    find the code that is at .text+0x23f4. That should give you a big clue.

I can't tell any more without knowing the command line & Makefile that you
are using to build the driver.


> make[5]: *** [/usr/src/linux-headers-6.15.6-amd64-mine/scripts/Makefile.build:408:
> mydriver.o] Error 255
> make[5]: *** Deleting file 'mydriver.o'
> make[4]: *** [/usr/src/linux-headers-6.15.6-amd64-mine/Makefile:2003: .] Error 2
> make[3]: *** [/usr/src/linux-headers-6.15.6-amd64-mine/Makefile:248:
> __sub-make] Error 2
> make[3]: Leaving directory
> '/media/sf_Source/mydriver/linux/driver/6.15.6-amd64-mine'
> make[2]: *** [Makefile:248: __sub-make] Error 2
> make[2]: Leaving directory '/usr/src/linux-headers-6.15.6-amd64-mine'
> make[1]: *** [Makefile:53: domake] Error 2
> make[1]: Leaving directory '/media/sf_Source/mydriver/linux/driver'
> make: *** [Makefile:44: all] Error 2
> error: Build failed.
> 

-- 
~Randy



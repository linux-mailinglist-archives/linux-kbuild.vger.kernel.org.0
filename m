Return-Path: <linux-kbuild+bounces-8321-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8955B1E0E6
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Aug 2025 05:17:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 941503BDAD6
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Aug 2025 03:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EDF47FD;
	Fri,  8 Aug 2025 03:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YRxobck7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E95935897
	for <linux-kbuild@vger.kernel.org>; Fri,  8 Aug 2025 03:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754623043; cv=none; b=VhBLnnDtCtH9SIxMrC7/PoDxFlROFig8FxZW/VTqgkKPMe/xgYjmBAGwLeLl+5nOez45FuBz9Aq31Rm60zV8QSpCFztS1d2YIlJt1RXgJg/DOMLEl9CUNX/WlfX1FDszcQ0hluyELcIJ1wy+oV1bzSJhBol1ct/vmZLs8v7erc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754623043; c=relaxed/simple;
	bh=9ioVpju6Vm9Qfu6wwDgjg71ifxt0NoAU9wqG5CCZrLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U/Lolx2Qwv3mRLbuM2rNrM6xYGvWU+KrvguOTPXTClaGYHC36SG2e56Sq5Eurs2oN0t5X0NR4I5rlp+04/JfZD30kdl85prtqdqfVJDgao3/V1Wh48VyFmZoGtoWrUK97ImznKf+EcerfGa81+xh1XBXlMswUUCLN9wpNgn5ASU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=YRxobck7; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=wKKrOUKbJ6ifm5njZic8qVYAh6eXtKYbbUoY6DDe1FY=; b=YRxobck77xOs9ABXZW/9CfEjJ9
	WdW3+rctuimZm4lxtNtdzfFBexn3j37dK15AYgfZ2CFXFLNoEE7UPMQGwiVGuTQ+i6VSLY5cgmXC7
	mtMo2PpYFN8xzFuwoVUBbXb17y3bzXXMNumORPuUToGsbEZlvaWTR5MosH9UoBX7+fSJKm/sSuX1F
	r8GzV9rJWjfuHWolcO/YhM4jJOAo7QA0blTLkcbd4P1ekGGzDXQ7LSqnvP+KOzTxeITdK4kW6MV95
	TwfJwbRU+SWb8QDlCNTp5Uy6s3BvY2SKnrsbaWUm0ty13MwZPa7xNw/G9FJcxx+eJlgtqym61olIp
	A6YrflyA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukDbb-00000001ua9-08jU;
	Fri, 08 Aug 2025 03:17:19 +0000
Message-ID: <d346638a-835c-404b-8109-9e0f44c09d88@infradead.org>
Date: Thu, 7 Aug 2025 20:17:18 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Unable to build custom amd64 module.
To: "David F." <df7729@gmail.com>, Nicolas Schier <nicolas.schier@linux.dev>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <CAGRSmLvRaFfLG-ksN=WHe3FrH4DOrcJud5BZynGhsrYc8c28ww@mail.gmail.com>
 <bf26afd4-7c4d-47ce-b294-093c15e31ec0@infradead.org>
 <CAGRSmLuViYdzsoPFtZ6PE9_Bo0VZB0Ccbs5c7Sy-bpct9eXr3g@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAGRSmLuViYdzsoPFtZ6PE9_Bo0VZB0Ccbs5c7Sy-bpct9eXr3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/7/25 7:16 PM, David F. wrote:
> Thanks, I used the OBJTOOL_VERBOSE=1  on the make and got this extra
> bit of information:
> 
> mydriver.o: warning: objtool: .text+0x23f4: unannotated intra-function call
> mydriver.o: error: objtool [builtin-check.c:220]: copy_file: sendfile
> failed: Invalid argument
> 
> The .o file still got deleted.
> 

Is bindeb-pkg removing the .o file?
Can you just do a routine external module driver build by just using your Makefile?


> I may have to go into the makefile in the kernel and pause where
> objtool is run  ?

That might work.
Please do what Nicolas suggested first:

  It looks like fixdep is built the way it should, so the next step would be
  running bindeb-pkg with V=1 and finding its gcc call for building fixdep and to
  verify both calls.  They should be (at least almost) the same.

It would also be helpful to see all of the command options for building 'objtool'
(in both cases [32-bit and 64-bit]) to compare them.


> On Wed, Aug 6, 2025 at 10:54 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> Hi,
>>
>> On 8/6/25 9:37 PM, David F. wrote:
>>> Hello,
>>>
>>> The last modules I built was from 6.6.x.  I'm trying to build for
>>> 6.15.x but it's failing for the amd64 version.    I'm building both a
>>> 686 and amd64 version of the module (driver) using the scripts I've
>>> used a long time.   The system is Devuan Chimaera 686 version.   The
>>> 686 module builds fine, but the amd64 get to the point shown below and
>>> fails.   Does it have to do with that warning?  What would cause that
>>> in the amd64 version but not the 686 version (everything is compiled
>>> from the same source).
>>>
>>> Any ideas how to work around this or find the problem.   The error
>>> code doesn't give me a clue of what it is:
>>
>> It does a little bit. Also read tools/objtool/Documentation/objtool.txt
>> in the kernel source tree: search for "unannotated".
>>
>>>
>>>   LD [M]  mydriver.o
>>> mydriver.o: warning: objtool: .text+0x23f4: unannotated intra-function call
>>
>> (1) prevent "Deleting file 'mydriver.o'" below (I don't know what is doing that.)
>>
>> (2) run
>>     $ objdump -CDlSxp -m i386:x86-64 mydriver.o >mydriver.od
>> (I have never used "-m i386:x86-64"; that's just what I found on the web.)
>>
>> (3) Edit/search mydriver.od:
>>     find the code that is at .text+0x23f4. That should give you a big clue.
>>
>> I can't tell any more without knowing the command line & Makefile that you
>> are using to build the driver.
>>

sendfile() is returning -1 with errno set to "invalid argument"; apparently
that's EINVAL although I don't know anything about ERROR_GLIBC().

'man sendfile' says that EINVAL is returned for either of 2 conditions:

       EINVAL Descriptor is not valid or locked, or an  mmap(2)-like  operation
              is not available for in_fd, or count is negative.

       EINVAL out_fd  has  the  O_APPEND  flag set.  This is not currently sup‐
              ported by sendfile().

but I don't see how that could be happening here.

I'm suspecting that the cross-build is causing one of sendfile() and sendfile64()
to be misused. The output that Nicolas suggested (with V=1) could help with that.


Does anything in your Makefile or source files set __USE_FILE_OFFSET64 or
__USE_LARGEFILE64?




>>
>>> make[5]: *** [/usr/src/linux-headers-6.15.6-amd64-mine/scripts/Makefile.build:408:
>>> mydriver.o] Error 255
>>> make[5]: *** Deleting file 'mydriver.o'
>>> make[4]: *** [/usr/src/linux-headers-6.15.6-amd64-mine/Makefile:2003: .] Error 2
>>> make[3]: *** [/usr/src/linux-headers-6.15.6-amd64-mine/Makefile:248:
>>> __sub-make] Error 2
>>> make[3]: Leaving directory
>>> '/media/sf_Source/mydriver/linux/driver/6.15.6-amd64-mine'
>>> make[2]: *** [Makefile:248: __sub-make] Error 2
>>> make[2]: Leaving directory '/usr/src/linux-headers-6.15.6-amd64-mine'
>>> make[1]: *** [Makefile:53: domake] Error 2
>>> make[1]: Leaving directory '/media/sf_Source/mydriver/linux/driver'
>>> make: *** [Makefile:44: all] Error 2
>>> error: Build failed.
-- 
~Randy



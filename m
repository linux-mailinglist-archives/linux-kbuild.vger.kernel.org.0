Return-Path: <linux-kbuild+bounces-1856-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1BE8C5B58
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 May 2024 20:50:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 477621C20A86
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 May 2024 18:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1C8251C45;
	Tue, 14 May 2024 18:50:17 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from domac.alu.hr (domac.alu.hr [161.53.235.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABEE18AEA;
	Tue, 14 May 2024 18:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.53.235.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715712617; cv=none; b=TYW2kfSVUyxzBVkVX55ZYo00bq4SxKjB+H6fbUjK4Two5nR4E3Ua+Al+CqrQGxyIvGpS4gVHIwELrG8gCDNkjUsN4BerHTL/lme47Ntvi5X+2CT2uSFwlQflMlZ4Auan6Bs44g7C9Sibzhg/wM7eMmAR5qrS7vs3/WHAwxI0P9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715712617; c=relaxed/simple;
	bh=hzBxnqhD5HTem+7UibDma0pD0CCxEuMCvVESuHswiZc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Rg+yHNN2Q8BViqyufnNP4M7p5w/+r1V7kBRWkAVF1IK1nvxdG/RhKX/8uWqKL1OfAbRbW9GuzCIY3qOuh3xTdIVsKu6LcMuRwrYEtc0DQ+XoIhkgClbIZdH27k38igbgAzqe2t41p3v67cE47P8nZZMpR8NhsJRFyEhp55u/Mz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=161.53.235.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (localhost [127.0.0.1])
	by domac.alu.hr (Postfix) with ESMTP id E699D601CD;
	Tue, 14 May 2024 20:45:00 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at domac.alu.hr
Received: from domac.alu.hr ([127.0.0.1])
	by localhost (domac.alu.hr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EV8DmCB-b6ym; Tue, 14 May 2024 20:44:58 +0200 (CEST)
Received: from [192.168.178.20] (dh207-43-52.xnet.hr [88.207.43.52])
	by domac.alu.hr (Postfix) with ESMTPSA id EF45D6018D;
	Tue, 14 May 2024 20:44:57 +0200 (CEST)
Message-ID: <466ee9f8-c87e-40c0-bafc-77e6c630a56a@gmail.com>
Date: Tue, 14 May 2024 20:44:52 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PROBLEM linux-next] Error in "make olddefconfig" and "make
 menuconfig"
From: Mirsad Todorovac <mtodorovac69@gmail.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Kernel Build System <linux-kbuild@vger.kernel.org>
References: <b948b14b-1543-4314-9e9e-58a54cf2b734@gmail.com>
Content-Language: en-US
In-Reply-To: <b948b14b-1543-4314-9e9e-58a54cf2b734@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/14/24 20:37, Mirsad Todorovac wrote:
> Hi, Mr. Bagas,
> 
> While bisecting a problem in linux-next tree, I came across the problem:
> 
> marvin@defiant:~/linux/kernel/linux-next$ git describe
> v6.7-rc5-2761-gefc11f34e25f
> marvin@defiant:~/linux/kernel/linux-next$ make olddefconfig
> make[2]: *** No targets.  Stop.
> make[1]: *** [/home/marvin/linux/kernel/linux-next/Makefile:621: scripts_basic] Error 2
> make: *** [Makefile:234: __sub-make] Error 2
> marvin@defiant:~/linux/kernel/linux-next$ make menuconfig
> make[2]: *** No targets.  Stop.
> make[1]: *** [/home/marvin/linux/kernel/linux-next/Makefile:621: scripts_basic] Error 2
> make: *** [Makefile:234: __sub-make] Error 2
> marvin@defiant:~/linux/kernel/linux-next$ 
> 
> Now, this occurred for the first time, and I don't know how to bail out.
> 
> I recall in past couple of years you have some insightful advice.
> 
> Thank you very much.

P.S.

If this can help, I thought that the debug info the Makefile might be useful, but I am
unable to see what goes wrong ...


marvin@defiant:~/linux/kernel/linux-next$ make -d olddefconfig
GNU Make 4.3
Built for x86_64-pc-linux-gnu
Copyright (C) 1988-2020 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Reading makefiles...
Reading makefile 'Makefile'...
Updating makefiles....
 Considering target file 'Makefile'.
  Looking for an implicit rule for 'Makefile'.
  No implicit rule found for 'Makefile'.
  Finished prerequisites of target file 'Makefile'.
 No need to remake target 'Makefile'.
Updating goal targets....
Considering target file 'olddefconfig'.
 File 'olddefconfig' does not exist.
  Considering target file '__sub-make'.
   File '__sub-make' does not exist.
   Finished prerequisites of target file '__sub-make'.
  Must remake target '__sub-make'.
Putting child 0x56da685e5ea0 (__sub-make) PID 12141 on the chain.
Live child 0x56da685e5ea0 (__sub-make) PID 12141 
GNU Make 4.3
Built for x86_64-pc-linux-gnu
Copyright (C) 1988-2020 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Reading makefiles...
Reading makefile '/home/marvin/linux/kernel/linux-next/Makefile'...
Reading makefile 'scripts/Kbuild.include' (search path) (no ~ expansion)...
Reading makefile 'scripts/subarch.include' (search path) (no ~ expansion)...
Reading makefile 'scripts/Makefile.compiler' (search path) (no ~ expansion)...
Reading makefile 'arch/x86/Makefile' (search path) (no ~ expansion)...
Updating makefiles....
 Considering target file 'arch/x86/Makefile'.
  Looking for an implicit rule for 'arch/x86/Makefile'.
  No implicit rule found for 'arch/x86/Makefile'.
  Finished prerequisites of target file 'arch/x86/Makefile'.
 No need to remake target 'arch/x86/Makefile'.
 Considering target file 'scripts/Makefile.compiler'.
  Looking for an implicit rule for 'scripts/Makefile.compiler'.
  No implicit rule found for 'scripts/Makefile.compiler'.
  Finished prerequisites of target file 'scripts/Makefile.compiler'.
 No need to remake target 'scripts/Makefile.compiler'.
 Considering target file 'scripts/subarch.include'.
  Looking for an implicit rule for 'scripts/subarch.include'.
  No implicit rule found for 'scripts/subarch.include'.
  Finished prerequisites of target file 'scripts/subarch.include'.
 No need to remake target 'scripts/subarch.include'.
 Considering target file 'scripts/Kbuild.include'.
  Looking for an implicit rule for 'scripts/Kbuild.include'.
  No implicit rule found for 'scripts/Kbuild.include'.
  Finished prerequisites of target file 'scripts/Kbuild.include'.
 No need to remake target 'scripts/Kbuild.include'.
 Considering target file '/home/marvin/linux/kernel/linux-next/Makefile'.
  Looking for an implicit rule for '/home/marvin/linux/kernel/linux-next/Makefile'.
  No implicit rule found for '/home/marvin/linux/kernel/linux-next/Makefile'.
  Finished prerequisites of target file '/home/marvin/linux/kernel/linux-next/Makefile'.
 No need to remake target '/home/marvin/linux/kernel/linux-next/Makefile'.
Updating goal targets....
Considering target file 'olddefconfig'.
 File 'olddefconfig' does not exist.
 Looking for an implicit rule for 'olddefconfig'.
 Trying pattern rule with stem 'olddef'.
 Trying rule prerequisite 'outputmakefile'.
 Trying rule prerequisite 'scripts_basic'.
 Trying rule prerequisite 'FORCE'.
 Found an implicit rule for 'olddefconfig'.
  Considering target file 'outputmakefile'.
   File 'outputmakefile' does not exist.
   Finished prerequisites of target file 'outputmakefile'.
  Must remake target 'outputmakefile'.
  Successfully remade target file 'outputmakefile'.
  Considering target file 'scripts_basic'.
   File 'scripts_basic' does not exist.
   Finished prerequisites of target file 'scripts_basic'.
  Must remake target 'scripts_basic'.
Putting child 0x5f53318546e0 (scripts_basic) PID 12208 on the chain.
Live child 0x5f53318546e0 (scripts_basic) PID 12208 
GNU Make 4.3
Built for x86_64-pc-linux-gnu
Copyright (C) 1988-2020 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Reading makefiles...
Reading makefile 'scripts/Makefile.build'...
Updating makefiles....
 Considering target file 'scripts/Makefile.build'.
  Looking for an implicit rule for 'scripts/Makefile.build'.
  No implicit rule found for 'scripts/Makefile.build'.
  Finished prerequisites of target file 'scripts/Makefile.build'.
 No need to remake target 'scripts/Makefile.build'.
make[2]: *** No targets.  Stop.
Reaping losing child 0x5f53318546e0 PID 12208 
make[1]: *** [/home/marvin/linux/kernel/linux-next/Makefile:621: scripts_basic] Error 2
Removing child 0x5f53318546e0 PID 12208 from chain.
Reaping losing child 0x56da685e5ea0 PID 12141 
make: *** [Makefile:234: __sub-make] Error 2
Removing child 0x56da685e5ea0 PID 12141 from chain.
marvin@defiant:~/linux/kernel/linux-next$ 

Hope this helps.

Best regards,
Mirsad Todorovac



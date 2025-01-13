Return-Path: <linux-kbuild+bounces-5466-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A64CA0BB76
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 16:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 466D0188567F
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 15:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63EC522BAAB;
	Mon, 13 Jan 2025 15:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b="a0nTCHvQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D255322981B
	for <linux-kbuild@vger.kernel.org>; Mon, 13 Jan 2025 15:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736780875; cv=none; b=pZEXo1VICBufBkzir3ysAmW6ThVyC1rNRb4iJaM3s26HkWft7hWWQAlE/ZtNlBF2f/5NZ51TN95O+txBxQDyL/TkEZhqK0V6wQF8wwgAAbY7FQF6NAwBGpOV4hBptvKSZGUKxoVH3/Pxg8Mvwza6XtNSPnyXZryC/GBBhgfMW/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736780875; c=relaxed/simple;
	bh=VflLVJpll41zBEnRp+E8ITyaeeYX7MDwxJHz6ZBXHnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jUgzdg5ven695F/gwABE9/BjXltrxPMAK2RT1xnBxQVXxrq/9q/GA1dDXVASDn8jIVww+ezPGtALXRIeFT+WEkZ+y6NiW2dVNEp3g5PNtgNuiJZbai9AFof6DxrHCr1sOVagckjF/LZWyMje8CbVN1qvqcKfZS4qg/M2yPK/0t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net; spf=pass smtp.mailfrom=w6rz.net; dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b=a0nTCHvQ; arc=none smtp.client-ip=44.202.169.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Received: from eig-obgw-6003a.ext.cloudfilter.net ([10.0.30.151])
	by cmsmtp with ESMTPS
	id XFMjtlOjWxoE1XM2atS7CJ; Mon, 13 Jan 2025 15:07:45 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id XM2ZtRYcF9EdGXM2Ztl5wF; Mon, 13 Jan 2025 15:07:44 +0000
X-Authority-Analysis: v=2.4 cv=WsrgMsfv c=1 sm=1 tr=0 ts=67852c40
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=7vwVE5O1G3EA:10 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=Z4Rwk6OoAAAA:8 a=JfrnYn6hAAAA:8 a=RiYDK7WvK0PClliYqTEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=HkZW87K1Qel5hWWM3VKY:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=hTR6fmoedSdf3N0JiVF8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FV80WBHquXMN08T5W3+Ksl5Dj9zljkMGlhhiCT+jC0k=; b=a0nTCHvQhX6w54cgFnZCw0LyXT
	GWgY9E/lD1WLSUkc9MATFq/00GiV8Ii3bG5i1lUSTAKmi1L1h/tl2iuqRMcdUIYcn4nlPmtlow3bh
	v4uKBnF+J1rx6BzI9UkEHtNGOLoIoN7T8Mlrb0/RqKbtUA8Q1YZE+uMshRIJkXY8tAE0LTOiFJoeA
	7aM/GfmgNucJXPIBnvIlb6nO0m3sOovdt0irk4ydGM7gTdb8Xme7LMfyJx433DYAVN9DcBuf5Psz2
	G6mFRi4Ii06jFo7pnaeiW3chkmSE/oP62ttawBvetF/9ffEzLycFnnh7o0xhA8hwzgh30dsZySUOW
	mhxgfs3Q==;
Received: from c-73-223-253-157.hsd1.ca.comcast.net ([73.223.253.157]:57814 helo=[10.0.1.116])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <re@w6rz.net>)
	id 1tXM2Z-0011Bx-0K;
	Mon, 13 Jan 2025 08:07:43 -0700
Message-ID: <82c4c224-1e3a-4fe1-8bec-a9a3d82cbf3f@w6rz.net>
Date: Mon, 13 Jan 2025 07:07:41 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kbuild: Strip runtime const RELA sections correctly
To: Ard Biesheuvel <ardb+git@google.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
References: <20250113143222.1868692-2-ardb+git@google.com>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20250113143222.1868692-2-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.223.253.157
X-Source-L: No
X-Exim-ID: 1tXM2Z-0011Bx-0K
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-223-253-157.hsd1.ca.comcast.net ([10.0.1.116]) [73.223.253.157]:57814
X-Source-Auth: re@w6rz.net
X-Email-Count: 7
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMx0Q/RpnHpvtE9jdhpRk1PgkEPpiOv8sNfzx+gjHLIrtY8T43dv6KXDgDlWTWABxwpBJ79EKBkpbuKHKbQSI1N8ZIHd7VL1t03HCzH2mVbhRnFmkGec
 QIKLa7ZhDWANu1MoIwVsfj+Q7nf5+Dgx+6EPO1xDw+rzAyjn9mY52/sM0n7bwUZ7oJOfQC0JkJGCGOLXWdGNZ6mgxqu85T5XgLY=

On 1/13/25 06:32, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Due to the fact that runtime const ELF sections are named without a
> leading period or double underscore, the RSTRIP logic that removes the
> static RELA sections from vmlinux fails to identify them. This results
> in a situation like below, where some sections that were supposed to get
> removed are left behind.
>
>    [Nr] Name                              Type            Address          Off     Size   ES Flg Lk Inf Al
>
>    [58] runtime_shift_d_hash_shift        PROGBITS        ffffffff83500f50 2900f50 000014 00   A  0   0  1
>    [59] .relaruntime_shift_d_hash_shift   RELA            0000000000000000 55b6f00 000078 18   I 70  58  8
>    [60] runtime_ptr_dentry_hashtable      PROGBITS        ffffffff83500f68 2900f68 000014 00   A  0   0  1
>    [61] .relaruntime_ptr_dentry_hashtable RELA            0000000000000000 55b6f78 000078 18   I 70  60  8
>    [62] runtime_ptr_USER_PTR_MAX          PROGBITS        ffffffff83500f80 2900f80 000238 00   A  0   0  1
>    [63] .relaruntime_ptr_USER_PTR_MAX     RELA            0000000000000000 55b6ff0 000d50 18   I 70  62  8
>
> So tweak the match expression to strip all sections starting with .rel.
> While at it, consolidate the logic used by RISC-V, s390 and x86 into a
> single shared Makefile library command.
>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Link: https://lore.kernel.org/all/CAHk-=wjk3ynjomNvFN8jf9A1k=qSc=JFF591W00uXj-qqNUxPQ@mail.gmail.com/
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
> v2: add missing include of scripts/Makefile.lib
>
>   arch/riscv/Makefile.postlink | 10 ++--------
>   arch/s390/Makefile.postlink  |  6 +-----
>   arch/x86/Makefile.postlink   |  6 +-----
>   scripts/Makefile.lib         |  3 +++
>   4 files changed, 7 insertions(+), 18 deletions(-)
>
> diff --git a/arch/riscv/Makefile.postlink b/arch/riscv/Makefile.postlink
> index 829b9abc91f6..750d2784f69e 100644
> --- a/arch/riscv/Makefile.postlink
> +++ b/arch/riscv/Makefile.postlink
> @@ -10,6 +10,7 @@ __archpost:
>   
>   -include include/config/auto.conf
>   include $(srctree)/scripts/Kbuild.include
> +include $(srctree)/scripts/Makefile.lib
>   
>   quiet_cmd_relocs_check = CHKREL  $@
>   cmd_relocs_check = 							\
> @@ -19,13 +20,6 @@ ifdef CONFIG_RELOCATABLE
>   quiet_cmd_cp_vmlinux_relocs = CPREL   vmlinux.relocs
>   cmd_cp_vmlinux_relocs = cp vmlinux vmlinux.relocs
>   
> -quiet_cmd_relocs_strip = STRIPREL $@
> -cmd_relocs_strip = $(OBJCOPY)   --remove-section='.rel.*'       \
> -                                --remove-section='.rel__*'      \
> -                                --remove-section='.rela.*'      \
> -                                --remove-section='.rela__*' $@
> -endif
> -
>   # `@true` prevents complaint when there is nothing to be done
>   
>   vmlinux: FORCE
> @@ -33,7 +27,7 @@ vmlinux: FORCE
>   ifdef CONFIG_RELOCATABLE
>   	$(call if_changed,relocs_check)
>   	$(call if_changed,cp_vmlinux_relocs)
> -	$(call if_changed,relocs_strip)
> +	$(call if_changed,strip_relocs)
>   endif
>   
>   clean:
> diff --git a/arch/s390/Makefile.postlink b/arch/s390/Makefile.postlink
> index df82f5410769..1ae5478cd6ac 100644
> --- a/arch/s390/Makefile.postlink
> +++ b/arch/s390/Makefile.postlink
> @@ -11,6 +11,7 @@ __archpost:
>   
>   -include include/config/auto.conf
>   include $(srctree)/scripts/Kbuild.include
> +include $(srctree)/scripts/Makefile.lib
>   
>   CMD_RELOCS=arch/s390/tools/relocs
>   OUT_RELOCS = arch/s390/boot
> @@ -19,11 +20,6 @@ quiet_cmd_relocs = RELOCS  $(OUT_RELOCS)/relocs.S
>   	mkdir -p $(OUT_RELOCS); \
>   	$(CMD_RELOCS) $@ > $(OUT_RELOCS)/relocs.S
>   
> -quiet_cmd_strip_relocs = RSTRIP  $@
> -      cmd_strip_relocs = \
> -	$(OBJCOPY) --remove-section='.rel.*' --remove-section='.rel__*' \
> -		   --remove-section='.rela.*' --remove-section='.rela__*' $@
> -
>   vmlinux: FORCE
>   	$(call cmd,relocs)
>   	$(call cmd,strip_relocs)
> diff --git a/arch/x86/Makefile.postlink b/arch/x86/Makefile.postlink
> index fef2e977cc7d..8b8a68162c94 100644
> --- a/arch/x86/Makefile.postlink
> +++ b/arch/x86/Makefile.postlink
> @@ -11,6 +11,7 @@ __archpost:
>   
>   -include include/config/auto.conf
>   include $(srctree)/scripts/Kbuild.include
> +include $(srctree)/scripts/Makefile.lib
>   
>   CMD_RELOCS = arch/x86/tools/relocs
>   OUT_RELOCS = arch/x86/boot/compressed
> @@ -20,11 +21,6 @@ quiet_cmd_relocs = RELOCS  $(OUT_RELOCS)/$@.relocs
>   	$(CMD_RELOCS) $@ > $(OUT_RELOCS)/$@.relocs; \
>   	$(CMD_RELOCS) --abs-relocs $@
>   
> -quiet_cmd_strip_relocs = RSTRIP  $@
> -      cmd_strip_relocs = \
> -	$(OBJCOPY) --remove-section='.rel.*' --remove-section='.rel__*' \
> -		   --remove-section='.rela.*' --remove-section='.rela__*' $@
> -
>   # `@true` prevents complaint when there is nothing to be done
>   
>   vmlinux: FORCE
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 7395200538da..f604f51d23ca 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -374,6 +374,9 @@ quiet_cmd_ar = AR      $@
>   quiet_cmd_objcopy = OBJCOPY $@
>   cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
>   
> +quiet_cmd_strip_relocs = RSTRIP  $@
> +cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' $@
> +
>   # Gzip
>   # ---------------------------------------------------------------------------
>   

Fails on RISC-V with:

   LD      vmlinux
   NM      System.map
   SORTTAB vmlinux
arch/riscv/Makefile.postlink:41: *** missing 'endif'.  Stop.
make[2]: *** [scripts/Makefile.vmlinux:34: vmlinux] Error 2
make[2]: *** Deleting file 'vmlinux'
make[1]: *** [/home/ubuntu/xfer/linux/Makefile:1167: vmlinux] Error 2
make: *** [Makefile:224: __sub-make] Error 2
Command exited with non-zero status 2

I think you need to put that deleted "endif" back in.



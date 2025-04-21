Return-Path: <linux-kbuild+bounces-6706-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7227EA94C57
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Apr 2025 08:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AF283AE3E3
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Apr 2025 06:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B3352571C6;
	Mon, 21 Apr 2025 06:04:37 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561F1258CC5;
	Mon, 21 Apr 2025 06:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745215477; cv=none; b=V6Ste/80aYPOKuxiiAX4ZOjsLijDnrVJSooGx5rk3cIns1s3NNejCtKcaPs5JsU58ZyOCydwS+PNk3H43uzZVHWEzvV4gYNuGXLgQ4mup4QPgVHdjvyEbC0x+v3dY1ljp5luURMVUFB5P7unhNd0z5bRtZJpFZTGGxkSY76I4Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745215477; c=relaxed/simple;
	bh=n43iKQ1gQcZ6UYLU7kJ37Nyk9QEUGWo8UtaRhUgH5tE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XiZtT8S95WOWkJHmhndfNkWcDGal+9rGt5ybFRJFVeZCUMNNx4wdY3sag9Mkj5irVp24jDXzHq3tDf7tbR/qCnv4UbM/4NkE5sLceNJ5XZtyoY2vCK4OzQ7meytyWDq4MpJgom6pW3+8u57tqe2utNpZLIiQZ1i5l4wvZ1qgA3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id C660B4435C;
	Mon, 21 Apr 2025 06:04:21 +0000 (UTC)
Message-ID: <75e07bb8-e9e2-428f-85d7-5c5b9dc7b1c5@ghiti.fr>
Date: Mon, 21 Apr 2025 08:04:21 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] scripts: Do not strip .rela.dyn section
Content-Language: en-US
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Ard Biesheuvel <ardb@kernel.org>, Charlie Jenkins <charlie@rivosinc.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kbuild@vger.kernel.org
References: <20250408072851.90275-1-alexghiti@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250408072851.90275-1-alexghiti@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedttdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhephfehgfdvteejiefgvdevkefgudehkeekhefgkedvtdeugedtvefffeejheektdfgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemudhfheejmegvudgtugemudekugdtmegttddvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemudhfheejmegvudgtugemudekugdtmegttddvkedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemudhfheejmegvudgtugemudekugdtmegttddvkegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtoheprghlvgigghhhihhtihesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgto
 hhmpdhrtghpthhtohepsghjohhrnhesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepmhgrshgrhhhirhhohieskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihgtohhlrghssehfjhgrshhlvgdrvghupdhrtghpthhtoheprghruggssehkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr

Hi Masahiro,

On 08/04/2025 09:28, Alexandre Ghiti wrote:
> The .rela.dyn section contains runtime relocations and is only emitted
> for a relocatable kernel.
>
> riscv uses this section to relocate the kernel at runtime but that section
> is stripped from vmlinux. That prevents kexec to successfully load vmlinux
> since it does not contain the relocations info needed.
>
> Fixes: 559d1e45a16d ("riscv: Use --emit-relocs in order to move .rela.dyn in init")
> Tested-by: Björn Töpel <bjorn@rivosinc.com>
> Reviewed-by: Björn Töpel <bjorn@rivosinc.com>
> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>
> Changes in v3:
> - Rebase on top of 6.15-rc1
> - Change the fixes tag
>
> Changes in v2:
> - Changelog modification (Ard)
> - Remove ARCH_WANTS_RELA_DYN (Ard)
>
>   scripts/Makefile.vmlinux | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index b0a6cd5b818c..85d60d986401 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -13,7 +13,7 @@ ifdef CONFIG_ARCH_VMLINUX_NEEDS_RELOCS
>   vmlinux-final := vmlinux.unstripped
>   
>   quiet_cmd_strip_relocs = RSTRIP  $@
> -      cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' $< $@
> +      cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' --remove-section=!'.rel*.dyn' $< $@
>   
>   vmlinux: $(vmlinux-final) FORCE
>   	$(call if_changed,strip_relocs)


Do you think you can merge that in the next rc? If not, I can merge it 
if you add your AB :)

Thanks,

Alex



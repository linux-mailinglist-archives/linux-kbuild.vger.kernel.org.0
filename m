Return-Path: <linux-kbuild+bounces-10372-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A766CEA58D
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Dec 2025 18:45:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4BFFC3004E14
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Dec 2025 17:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5691A32B996;
	Tue, 30 Dec 2025 17:45:00 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718C02459D1;
	Tue, 30 Dec 2025 17:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767116700; cv=none; b=WCYn6y8jGUjZDL8aca38pWcRJS8GN5IWRMmiDsAAYSJgH6OjZKNLamg5ex3OqKfJX0PbRaIGHIPkSnz5Pg0atzGrlogwIDOEZkV8pIKc7qVdDQdBtCp0p6DaTgdnoBSiDHWk40leO4WdLIbQiax6REtbglRIT9jrs4zMLyowzlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767116700; c=relaxed/simple;
	bh=DeJWlGj1JZflue6+8vp2aWS/DeUnY4SfXD9zpP2wT54=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=dDTMwWMVG7bAR0QpKj8W83w+nhhrvI67EMd18/hOpxu8ZjDTEHIsXnAcXfM50QJ/ZL1SW5ygeyps+TTSs6Vfwfs+FdZA0UuzDw3e+R3EAxusjhCcET5rcYV0XN+HWImi8H14xlXy7yyh6XkKIXboRtr6QBKxODGt6Q1uS4r1i3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from smtpclient.apple (unknown [58.38.116.204])
	by APP-03 (Coremail) with SMTP id rQCowAAHKeBqD1Rp4MmmAg--.62002S2;
	Wed, 31 Dec 2025 01:44:11 +0800 (CST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH] riscv: boot: Always make Image from vmlinux, not
 vmlinux.unstripped
From: Han Gao <gaohan@iscas.ac.cn>
In-Reply-To: <20251230-riscv-vmlinux-not-unstripped-v1-1-15f49df880df@iscas.ac.cn>
Date: Wed, 31 Dec 2025 01:44:00 +0800
Cc: Han Gao <gaohan@iscas.ac.cn>,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Nathan Chancellor <nathan@kernel.org>,
 Alexey Gladkov <legion@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nicolas Schier <nsc@kernel.org>,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <15D6E841-BA8C-43D0-B08D-170DF475AB3B@iscas.ac.cn>
References: <20251230-riscv-vmlinux-not-unstripped-v1-1-15f49df880df@iscas.ac.cn>
To: Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CM-TRANSID:rQCowAAHKeBqD1Rp4MmmAg--.62002S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFyUKF1kGF4fuFy8uF48JFb_yoW8ZF4rp3
	yDuw1YkrWUJrWjgFy0yr429FW2qFn0g3yfZFy5KF1UtFWjqF1vqwnFg3yUWFyDGFnaga1U
	Xr4fGas5Ca40y3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiBg0MDGlT6Zg9CAAAs1



> On Dec 30, 2025, at 21:39, Vivian Wang <wangruikang@iscas.ac.cn> wrote:
> 
> Since commit 4b47a3aefb29 ("kbuild: Restore pattern to avoid stripping
> .rela.dyn from vmlinux") vmlinux has .rel*.dyn preserved. Therefore, use
> vmlinux to produce Image, not vmlinux.unstripped.
> 
> Doing so fixes booting a RELOCATABLE=y Image with kexec. The problem is
> caused by this chain of events:
> 
> - Since commit 3e86e4d74c04 ("kbuild: keep .modinfo section in
>  vmlinux.unstripped"), vmlinux.unstripped gets a .modinfo section.
> - The .modinfo section has SHF_ALLOC, so it ends up in Image, at the end
>  of it.
> - The Image header's image_size field does not expect to include
>  .modinfo and does not account for it, since it should not be in Image.
> - If .modinfo is large enough, the file size of Image ends up larger
>  than image_size, which eventually leads to it failing
>  sanity_check_segment_list().
> 
> Using vmlinux instead of vmlinux.unstripped means that the unexpected
> .modinfo section is gone from Image, fixing the file size problem.
> 
> Cc: stable@vger.kernel.org
> Fixes: 3e86e4d74c04 ("kbuild: keep .modinfo section in vmlinux.unstripped")
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> ---
> arch/riscv/boot/Makefile | 4 ----
> 1 file changed, 4 deletions(-)
> 
> diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
> index bfc3d0b75b9b..5301adf5f3f5 100644
> --- a/arch/riscv/boot/Makefile
> +++ b/arch/riscv/boot/Makefile
> @@ -31,11 +31,7 @@ $(obj)/xipImage: vmlinux FORCE
> 
> endif
> 
> -ifdef CONFIG_RELOCATABLE
> -$(obj)/Image: vmlinux.unstripped FORCE
> -else
> $(obj)/Image: vmlinux FORCE
> -endif
> $(call if_changed,objcopy)
> 
> $(obj)/Image.gz: $(obj)/Image FORCE
> 
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251230-riscv-vmlinux-not-unstripped-30ec0c930fd2
> 
> Best regards,
> -- 
> Vivian "dramforever" Wang

Tested-by: Han Gao <gaohan@iscas.ac.cn>




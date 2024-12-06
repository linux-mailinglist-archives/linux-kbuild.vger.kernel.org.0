Return-Path: <linux-kbuild+bounces-5019-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A71CE9E6975
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Dec 2024 09:58:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85CFD166360
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Dec 2024 08:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DC231E0DED;
	Fri,  6 Dec 2024 08:58:46 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EF8979DC;
	Fri,  6 Dec 2024 08:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733475526; cv=none; b=OGHIKywOE6oPtxF83TSqp/5BwGpkhPToAnX24r49IsvHnQy1Vp5mm1qc+Ltk1bEukIDEeCKOCMRXz7WnAvS/nnroMeoiZWrBeGVENgs+PMpSTf0LARXYoj3UDNePA6UhNNVkqhgu4JuIs2UAgGM3yNp49fn6jqMjiS6RN4SIDkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733475526; c=relaxed/simple;
	bh=ZemS1sodgjC3cZHxf11uqrAhrCPKKD2kAtEf85QNgoM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tMB8IdR9MJSKUy3oqRFHpUj9VBl2Wt/dFX3GmId2qq2JSWoiCJ7+nIFFfbTv0XxgPI7KtEbU2FVTChx9TmYo4QU8XpbaHmO/K1vo2wvd9KrOw8bw+luT22/vqdj9B1qtISTW3Nrwg4rrCXtZh/H5EPme5wroCkXlpBw97hjv/Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.38])
	by gateway (Coremail) with SMTP id _____8BxPOK5vFJn3hRSAA--.28430S3;
	Fri, 06 Dec 2024 16:58:33 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.38])
	by front1 (Coremail) with SMTP id qMiowMAxIMOovFJnxhx4AA--.14616S2;
	Fri, 06 Dec 2024 16:58:31 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: Xuerui Wang <kernel@xen0n.name>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	stable@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Huacai Chen <chenhuacai@loongson.cn>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH 6.1&6.6 0/3] kbuild: Avoid weak external linkage where possible
Date: Fri,  6 Dec 2024 16:58:07 +0800
Message-ID: <20241206085810.112341-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxIMOovFJnxhx4AA--.14616S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxCry8Kr4fCFy8XF1xGF48uFX_yoW5GFWkpr
	W3ur4fJF4UAryI9w1fJa1xu3y3X3Z7u3W7Ga9xKry8urs5XryIq3yvyr95XasFk3y0qa4F
	vr9rta42gFyUAagCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8HKZJUUUUU==

Backport this series to 6.1&6.6 because LoongArch gets build errors with
latest binutils which has commit 599df6e2db17d1c4 ("ld, LoongArch: print
error about linking without -fPIC or -fPIE flag in more detail").

  CC      .vmlinux.export.o
  UPD     include/generated/utsversion.h
  CC      init/version-timestamp.o
  LD      .tmp_vmlinux.kallsyms1
loongarch64-unknown-linux-gnu-ld: kernel/kallsyms.o:(.text+0): relocation R_LARCH_PCALA_HI20 against `kallsyms_markers` can not be used when making a PIE object; recompile with -fPIE
loongarch64-unknown-linux-gnu-ld: kernel/crash_core.o:(.init.text+0x984): relocation R_LARCH_PCALA_HI20 against `kallsyms_names` can not be used when making a PIE object; recompile with -fPIE
loongarch64-unknown-linux-gnu-ld: kernel/bpf/btf.o:(.text+0xcc7c): relocation R_LARCH_PCALA_HI20 against `__start_BTF` can not be used when making a PIE object; recompile with -fPIE
loongarch64-unknown-linux-gnu-ld: BFD (GNU Binutils) 2.43.50.20241126 assertion fail ../../bfd/elfnn-loongarch.c:2673

In theory 5.10&5.15 also need this, but since LoongArch get upstream at
5.19, so I just ignore them because there is no error report about other
archs now.

Weak external linkage is intended for cases where a symbol reference
can remain unsatisfied in the final link. Taking the address of such a
symbol should yield NULL if the reference was not satisfied.

Given that ordinary RIP or PC relative references cannot produce NULL,
some kind of indirection is always needed in such cases, and in position
independent code, this results in a GOT entry. In ordinary code, it is
arch specific but amounts to the same thing.

While unavoidable in some cases, weak references are currently also used
to declare symbols that are always defined in the final link, but not in
the first linker pass. This means we end up with worse codegen for no
good reason. So let's clean this up, by providing preliminary
definitions that are only used as a fallback.

Ard Biesheuvel (3):
  kallsyms: Avoid weak references for kallsyms symbols
  vmlinux: Avoid weak reference to notes section
  btf: Avoid weak external references

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 include/asm-generic/vmlinux.lds.h | 28 ++++++++++++++++++
 kernel/bpf/btf.c                  |  7 +++--
 kernel/bpf/sysfs_btf.c            |  6 ++--
 kernel/kallsyms.c                 |  6 ----
 kernel/kallsyms_internal.h        | 30 ++++++++------------
 kernel/ksysfs.c                   |  4 +--
 lib/buildid.c                     |  4 +--
 7 files changed, 52 insertions(+), 33 deletions(-)
---
2.27.0



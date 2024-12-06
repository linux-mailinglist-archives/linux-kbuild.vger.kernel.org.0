Return-Path: <linux-kbuild+bounces-5022-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 559F19E6981
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Dec 2024 09:59:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DBBE18862A5
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Dec 2024 08:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495321EF0A5;
	Fri,  6 Dec 2024 08:59:07 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676791E0DEA;
	Fri,  6 Dec 2024 08:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733475547; cv=none; b=qO8O/vOKXi2zAN714Z73Aud9FFmU8ipltEf0Q9sUPbhqFdHz6MGyiksvKorJpabsZ2VE+8Iv5vFIopAQE5DJmCV5IW0bFYoFlYMIQreNQ+jUAFO72W9KveyTZpfB8HuGsGrF982zD7dPUMKV9kfQbPBUdBoslEizBI4zr+o2pqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733475547; c=relaxed/simple;
	bh=ivXaeeaU9UM7l7T44ln7gNFe12aTPHAprFvqbRKTxWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s083XnJPl/5VRc/wUc0dVfjL1PMHWTj3fczTDKDkybidJ2Rdbc2qeXiJDd/MuJq5ToSoJchlK4eetJM5rkvB5Cukdp3jmkuvdx5o7sCedaWDtiH0XJ/iORGQwOBrZDjRMoLiE6BEK+20mg7ApqY30hc068vQRQ+vMs0K+JSX5dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.38])
	by gateway (Coremail) with SMTP id _____8AxQK3WvFJnOBVSAA--.54917S3;
	Fri, 06 Dec 2024 16:59:02 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.38])
	by front1 (Coremail) with SMTP id qMiowMAxIMOovFJnxhx4AA--.14616S5;
	Fri, 06 Dec 2024 16:58:57 +0800 (CST)
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
	Ard Biesheuvel <ardb@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jiri Olsa <jolsa@kernel.org>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH 6.1&6.6 3/3] btf: Avoid weak external references
Date: Fri,  6 Dec 2024 16:58:10 +0800
Message-ID: <20241206085810.112341-4-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20241206085810.112341-1-chenhuacai@loongson.cn>
References: <20241206085810.112341-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxIMOovFJnxhx4AA--.14616S5
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxGF45uryxWw4rAFWxXF15Jrc_yoW5Aw1Upr
	s3GF1UKr4UJw1Iqr1DGF4rua4avw1rJw1xJryDCw4rAas0qrnaq3WjqrWSqFn09rWqkFya
	vr1aqayavayUZ3cCm3ZEXasCq-sJn29KB7ZKAUJUUUUf529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBSb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42
	xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF
	7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4YLvDUUUU

From: Ard Biesheuvel <ardb@kernel.org>

[ Upstream commit fc5eb4a84e4c063e75a6a6e92308e9533c0f19b5 ]

If the BTF code is enabled in the build configuration, the start/stop
BTF markers are guaranteed to exist. Only when CONFIG_DEBUG_INFO_BTF=n,
the references in btf_parse_vmlinux() will remain unsatisfied, relying
on the weak linkage of the external references to avoid breaking the
build.

Avoid GOT based relocations to these markers in the final executable by
dropping the weak attribute and instead, make btf_parse_vmlinux() return
ERR_PTR(-ENOENT) directly if CONFIG_DEBUG_INFO_BTF is not enabled to
begin with.  The compiler will drop any subsequent references to
__start_BTF and __stop_BTF in that case, allowing the link to succeed.

Note that Clang will notice that taking the address of __start_BTF can
no longer yield NULL, so testing for that condition becomes unnecessary.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
Acked-by: Andrii Nakryiko <andrii@kernel.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Jiri Olsa <jolsa@kernel.org>
Link: https://lore.kernel.org/bpf/20240415162041.2491523-8-ardb+git@google.com
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 kernel/bpf/btf.c       | 7 +++++--
 kernel/bpf/sysfs_btf.c | 6 +++---
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
index c8828016a66f..f231e2a273a1 100644
--- a/kernel/bpf/btf.c
+++ b/kernel/bpf/btf.c
@@ -5574,8 +5574,8 @@ static struct btf *btf_parse(const union bpf_attr *attr, bpfptr_t uattr, u32 uat
 	return ERR_PTR(err);
 }
 
-extern char __weak __start_BTF[];
-extern char __weak __stop_BTF[];
+extern char __start_BTF[];
+extern char __stop_BTF[];
 extern struct btf *btf_vmlinux;
 
 #define BPF_MAP_TYPE(_id, _ops)
@@ -5724,6 +5724,9 @@ struct btf *btf_parse_vmlinux(void)
 	struct btf *btf = NULL;
 	int err;
 
+	if (!IS_ENABLED(CONFIG_DEBUG_INFO_BTF))
+		return ERR_PTR(-ENOENT);
+
 	env = kzalloc(sizeof(*env), GFP_KERNEL | __GFP_NOWARN);
 	if (!env)
 		return ERR_PTR(-ENOMEM);
diff --git a/kernel/bpf/sysfs_btf.c b/kernel/bpf/sysfs_btf.c
index ef6911aee3bb..fedb54c94cdb 100644
--- a/kernel/bpf/sysfs_btf.c
+++ b/kernel/bpf/sysfs_btf.c
@@ -9,8 +9,8 @@
 #include <linux/sysfs.h>
 
 /* See scripts/link-vmlinux.sh, gen_btf() func for details */
-extern char __weak __start_BTF[];
-extern char __weak __stop_BTF[];
+extern char __start_BTF[];
+extern char __stop_BTF[];
 
 static ssize_t
 btf_vmlinux_read(struct file *file, struct kobject *kobj,
@@ -32,7 +32,7 @@ static int __init btf_vmlinux_init(void)
 {
 	bin_attr_btf_vmlinux.size = __stop_BTF - __start_BTF;
 
-	if (!__start_BTF || bin_attr_btf_vmlinux.size == 0)
+	if (bin_attr_btf_vmlinux.size == 0)
 		return 0;
 
 	btf_kobj = kobject_create_and_add("btf", kernel_kobj);
-- 
2.43.5



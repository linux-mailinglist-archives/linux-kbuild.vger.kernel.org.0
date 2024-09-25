Return-Path: <linux-kbuild+bounces-3762-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9849863BA
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 17:37:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCD70B2CCE1
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 15:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8340119A2B0;
	Wed, 25 Sep 2024 15:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P/ZioVwW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB8F199958
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 15:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727276573; cv=none; b=Bqgskx7SIx6+xvEDj5S2hdKEMwgSBS0vffD+b35LcS66AdWF6qahAR3Xt8vugp1cRwvMjgzOuQO/tjem6nhmMpk042pVBK3Bzt51qpr0gdmVZmQ4if6eOSmdj4pgmJtUKy7BmULlbkc2watIBbBPwdUK4ESTjmCYNUx7xx4mcuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727276573; c=relaxed/simple;
	bh=EsUvuG/+LSwzxafWhuDBMbAgVDelZ/qjsxvBGmyQnpk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dzrsHH+Y/hC18GaUgRM3y8Lsp0hgcObcai53NhPyCZSRXhT3ipLAhlM+W6BQ0PgL0ahwwLVFcIH6wLCJDFK6ek1eW+p0NmZpmDR5Ztwt+cS1xuIVd+/t464qtSKz5YYCauU16WVu5o7zaVYZ5/SEAKKe5RuHcNkPClb4ohEkjrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P/ZioVwW; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6ddbaec823eso106103107b3.0
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 08:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276569; x=1727881369; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CRXmTW/MqFQ5H7gO5V6pXIYv4aezSxVZvDN4lDSH+kA=;
        b=P/ZioVwWWRNp9V7vflmCR+7le0HghWzxdDRiNOyUhKbgLsS3ekVJ3ImyQZX5WNmMac
         YOeG6qEKLLn0LIXg5bJsLosIOTxe9z5y4Sc/SsSyqYAFgZ3k6ljmlUa2MDTBX0CARbEf
         zke3q9XHmDmMgwQCBj1brJkMIT8Lmyj5RrM2gqAMWAfbTXFs8vZidD1mQdK2h+pPM+RZ
         MWtGEXkm+KTjRhK3w3cYOvhqT8U7zURD9goRiJg6KJmplj65HwOuVJdkgI7ZyAWCvmd+
         UUvICkekTsTFylSmBxQdCWbt4uD/ZW73TRgAvQ3wzeNfJ4+6DDaqMMaWwgAGQuM3I25T
         L04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276569; x=1727881369;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CRXmTW/MqFQ5H7gO5V6pXIYv4aezSxVZvDN4lDSH+kA=;
        b=tKhjjx08RICcUPQDoTGk/QyyP6mFsb/hwR2kywNnHvAnp0gBzwqQezQOF7Xd2FONpT
         hRBzkxpHpFGl90KYkrXgYuHqc/x2iIkvPWv8r8EcsZd936kZabibKzuj/bhnuqHkhl+l
         aBh1DMFg9s2k7Xq1s2ZhRvbMvhwDM7lS78oHLppItVQGQo9wqtmst1kObq6BD0To/MuZ
         AFrI5+znjHb6029ZgyGRU4cSvtTjAfT2plBaQ7Z3Exekg6O5Ow98o7D5aIy3h8wVOJnM
         Ymg7+1dRWz784HnWCrwNAwrnBvT1O0honPu4tgO+XPunyVs5zI50lwpAhOX5gyxE6iu5
         9itg==
X-Forwarded-Encrypted: i=1; AJvYcCWxH0nJCGxUSSFdSZv3M1yJJHekGdcRo2+NF7bVjAzhAaOUoPYURXkNNqQnMDqidgrEE3pJpYTeoXuC6gc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz46P+II4hw8vbA/CpHEusAtiNtZudUuV7acpQkcCIrCXMpc56R
	QXDkyQFb9SUwvVIbv/CFQxDr43KDcL3YWzYd2D5K7losUHNjkFPw2Mt3BZzGMNHCDmG2mA==
X-Google-Smtp-Source: AGHT+IEC1dPqUcAfKXMWGhZtWcpNQB40zyIE7CTDx8E05n1FmrMxkCCUsqBlLo74/YEl/S1/swIJOPiD
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a5b:841:0:b0:e1d:7ce:4844 with SMTP id
 3f1490d57ef6-e24d7ee7f12mr17133276.4.1727276569059; Wed, 25 Sep 2024 08:02:49
 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:23 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1309; i=ardb@kernel.org;
 h=from:subject; bh=AFLlY9eKyU6HJQ3jUUf7ewU02HHQByNyZjoPWXcfJAc=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6pkD1l1SMr9PdplxF72UMD0WHhu/+uT9iz8dfy0Km
 CzCpZrbUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACbCVcjIsG+u8YbnfWsvLOy8
 8P/8g7N6wi1XH/y+rLV/v86EltfmLq8ZGR6dT3mnbCtQs96/+mLXk3mrOl5/49b4OFvBlCnX4bD oQm4A
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-53-ardb+git@google.com>
Subject: [RFC PATCH 23/28] tools/objtool: Mark generated sections as writable
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Uros Bizjak <ubizjak@gmail.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

objtool generates ELF sections such as __mcount_loc, which carry
absolute symbol references that need to be fixed up at boot time, based
on the actual virtual placement of the kernel binary.

This involves writing to the section at boot time, and in some cases
(e.g., when using --pie and -z text), the lld linker is more pedantic
about this, and complains about absolute relocations operating on
read-only sections.

None of this actually matters for vmlinux, which manages its own mapping
permissions, and so we can just set the SHF_WRITE flag on those sections
to make the linker happy.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 tools/objtool/elf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index 3d27983dc908..26a39b010c92 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -1142,7 +1142,7 @@ struct section *elf_create_section(struct elf *elf, const char *name,
 	sec->sh.sh_entsize = entsize;
 	sec->sh.sh_type = SHT_PROGBITS;
 	sec->sh.sh_addralign = 1;
-	sec->sh.sh_flags = SHF_ALLOC;
+	sec->sh.sh_flags = SHF_ALLOC | SHF_WRITE;
 
 	/* Add section name to .shstrtab (or .strtab for Clang) */
 	shstrtab = find_section_by_name(elf, ".shstrtab");
-- 
2.46.0.792.g87dc391469-goog



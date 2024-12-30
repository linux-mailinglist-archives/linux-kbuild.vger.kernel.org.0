Return-Path: <linux-kbuild+bounces-5273-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F59F9FEB66
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Dec 2024 23:31:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 592F91883295
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Dec 2024 22:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86CA21B0418;
	Mon, 30 Dec 2024 22:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wLShl572"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2BF1A0BD6
	for <linux-kbuild@vger.kernel.org>; Mon, 30 Dec 2024 22:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735597839; cv=none; b=OquTkUFjT2VU9YozaW9gNKwT0+iTWqI9Z9BI/8LtmqRrRyGEC/qAovz99Iyzxmq+U8WE0Vbimlpx9voT/2H3OKz93K6D9AbVdsz9jT4GkKL2/o+lsdYpY7ZTI09rCCUNs9iZDiB26qnXngsZN9TbpGW11X9qIFiVEMJTNOLuoek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735597839; c=relaxed/simple;
	bh=XKLtg6hasoIGAI7uNbbTgs8kYTxARwPlbSF6Jrbr4s0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GTQUwMQYNSBRM3evDSHOixLmkLgnicBnFn9r2pb5NaXKUKTGJQaUgMXbr2J9JqrxC0MU3bf/szIocU5LnhomZRlFGjJh7KYsm83by6fJzibXJsHoI/FIVjmnfq0Gc8hZoRwFcOmfyaZfcHPZkxWTLgiUKvINtFAi3N6VW018wok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wLShl572; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2f129f7717fso13013890a91.0
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Dec 2024 14:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735597837; x=1736202637; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vj7WTgvEC5PveVDeiSHDuXxxtWMFpPRYSD2aMV1KZG0=;
        b=wLShl572YkeuA5fZGkjJqkpM7xziLF2hODFbzet1Yj/nLXUeHdi3d0ANtzSl3bbyCk
         /zdzc6+TIrq+8aURasIPqLnoohGx34q7ahWTmNWMg4jUs0/UdNWPdy7PXra+gqGzHsjV
         nvxk+pKYUuuFWeYRL9tLns3JZAlk35S4saYvKwuEY9eXHOPhiOrQtcstoK2/g3GKphQr
         pwg6su2bns3++L2NlJJHNBYbo22xVkUlI9r7x2YCpxqSIReu6QB6FlIBnhpm/j4XpRw1
         XUL8LYvr//F9PvhwsvxOPEoJnEZb1WhAT8Ga80ooUUwn8aa+ZWd1rH9MoIq7hrSa93OS
         3llw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735597837; x=1736202637;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vj7WTgvEC5PveVDeiSHDuXxxtWMFpPRYSD2aMV1KZG0=;
        b=DBZFoahfsDXiVo/tQaVPrJHPtRnmqx65q6wWzNKXZ+ISbAMI8g12QPEIf2JCigCOQz
         Xz59xRcpA3nNVrSH+Gso8LEB0U7wihbvIGwGVPC29L3MBbNSRN9nAc+VQoptjxIuzK6F
         BnPI49FnNshhDzrMbj8cO5kO8wi7BXGprvlnehGrqD321u5/OOPyTQbcMKH6km1+jNSs
         MGMgvlosRvhaADfPZ8+2jYUuQmcHErU2ctP8dNaDZwbBJNU13h2ipPZoCfvyohEXXdxs
         H7odlgOGm1voI1R0nQ9KBaw1ncpIzSOJRFMURYKADqTb+cQX0lDxX3eDoXszoZsWo+2q
         ySHA==
X-Forwarded-Encrypted: i=1; AJvYcCW204xEfvCIigM0E3A/6YP0tRVVZFKBt0impYToMMlB03tDZnwxLa6mzXYOJMuBwae12KkOSTXXor03WBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxanxsP/hUNvyUbYlRYmWbL5FrjqorLsGQVo9TfPIUeo0nAwAm6
	WPt+lPoYn0mwNc8p4qtKQU81VixImpVZ2mtoeAX8XRv8QKZc1+jkHVY6tCxTTGXE7q2JCmnU1Sl
	chh5Z5A==
X-Google-Smtp-Source: AGHT+IH7lc1nyh322CeIPNFTmhSrY+WwroJDc14f4njjj+YFTtVUIi6WYQ2iNzBtq2Ci0HPEKUE6eWlngS24
X-Received: from pjtu11.prod.google.com ([2002:a17:90a:c88b:b0:2f2:e933:8ba6])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3d09:b0:2ea:61de:38f7
 with SMTP id 98e67ed59e1d1-2f452ee6340mr56277909a91.29.1735597836920; Mon, 30
 Dec 2024 14:30:36 -0800 (PST)
Date: Mon, 30 Dec 2024 22:30:31 +0000
In-Reply-To: <20241230-extended-modversions-v12-0-296a6a0f5151@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241230-extended-modversions-v12-0-296a6a0f5151@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20241230-extended-modversions-v12-4-296a6a0f5151@google.com>
Subject: [PATCH v12 4/5] Documentation/kbuild: Document storage of symbol information
From: Matthew Maurer <mmaurer@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Document where exported and imported symbols are kept, format options,
and limitations.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 Documentation/kbuild/modules.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index 101de236cd0c9abe1f5684d80063ff3f9a7fc673..a42f00d8cb90ff6ee44677c1278287ef25a84c89 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -423,6 +423,26 @@ Symbols From the Kernel (vmlinux + modules)
 	1) It lists all exported symbols from vmlinux and all modules.
 	2) It lists the CRC if CONFIG_MODVERSIONS is enabled.
 
+Version Information Formats
+---------------------------
+
+	Exported symbols have information stored in __ksymtab or __ksymtab_gpl
+	sections. Symbol names and namespaces are stored in __ksymtab_strings,
+	using a format similar to the string table used for ELF. If
+	CONFIG_MODVERSIONS is enabled, the CRCs corresponding to exported
+	symbols will be added to the __kcrctab or __kcrctab_gpl.
+
+	If CONFIG_BASIC_MODVERSIONS is enabled (default with
+	CONFIG_MODVERSIONS), imported symbols will have their symbol name and
+	CRC stored in the __versions section of the importing module. This
+	mode only supports symbols of length up to 64 bytes.
+
+	If CONFIG_EXTENDED_MODVERSIONS is enabled (required to enable both
+	CONFIG_MODVERSIONS and CONFIG_RUST at the same time), imported symbols
+	will have their symbol name recorded in the __version_ext_names
+	section as a series of concatenated, null-terminated strings. CRCs for
+	these symbols will be recorded in the __version_ext_crcs section.
+
 Symbols and External Modules
 ----------------------------
 

-- 
2.47.1.613.gc27f4b7a9f-goog



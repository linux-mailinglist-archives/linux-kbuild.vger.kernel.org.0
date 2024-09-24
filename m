Return-Path: <linux-kbuild+bounces-3719-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B60984CCA
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 23:24:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1433A1F2459E
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 21:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194A01AED3A;
	Tue, 24 Sep 2024 21:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HwI+U77b"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795721AED29
	for <linux-kbuild@vger.kernel.org>; Tue, 24 Sep 2024 21:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727212860; cv=none; b=ZE1eIVgXVYUQkZR5iWs/aawBiIze+R0efviQ8mVQagqLnC/QhbU/H34QcZxJqXvE4dqAeSOBY3rWV8w24elqJIKcPAm/N8O7lROr/hiSGDckrCubm+mFi9+ZBHBKtHkG1GweEXQqi3MH4YeI3Uuc2/94O9i6VdVlT5Eg9CGipGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727212860; c=relaxed/simple;
	bh=W7tU7P3GNG+a73WgyQWeP1re2H5Hhpn0LeAD9h0akfE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=McmLRXEVr3OukRFxFReBXDVzu8Mn+A0BIEhE3/6Mf5bf98K3zQsGetsvgw+HvsGShkPA8MSvUFiRYJS/xrwLB0Nv/t5hj0ozJbzncsNDRIIrXHb/mbSnT3ksWrAC56R7ZRBhEvYBhS6hZJRTG2Eu9PGjF/Iacu5A9xHm8o/QL9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HwI+U77b; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e1cfb9d655eso8968657276.0
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Sep 2024 14:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727212857; x=1727817657; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=t2yLoLuY3hdxUDQj4FAKHilbBg2KnzEPjHr+p4Rv35M=;
        b=HwI+U77bj+GqX7K60MWegnMNnab1+DPXn+IeFDbW+E6SG6umYYogQ0goD9vzAncbtM
         Yut5kCBjl4ICyCnPBi9OXzH2rv7ke5ANQM99+7NfpVFE9do9EMdVSQgsDHWQIzR9sdDw
         aAqOEWegaujTL7/6OIqS4PcigdswO3K0SI1oqD2D85IwWZ1Kt7pA+Ok7Ba1BOjkl96qt
         E/7isxgtZ7x8HUA6HWCpyEtEpT+HVUd2518h6NJlrMrVCDlLpa8uTfU1VoM9X3+kGqxf
         0QJohd8vLiqTioiAZEcNFYlV2U0oNNVrc/Cfex3ay3tLNIJjkx+q6PBhQImnZxMPvA56
         kObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727212857; x=1727817657;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t2yLoLuY3hdxUDQj4FAKHilbBg2KnzEPjHr+p4Rv35M=;
        b=pC+/VkgxBl+r6HtLqdDi4svbRbFJwItbyHQPCZ8sonNjbBSUK21LYWfn/PJmei3zvX
         YVkDk0bSSrHNljsNS2u/+aqEnQjUzyrMHVwr8/M0NOX3hNpfIrcqvFHmJuDkPttmUGhR
         ghNkqFWt1h+KnZIql4e4kUnCjtRjuxoYV3ocCNXhoePk7rx3zs2/1sgNUjWTwZiKR8e5
         21eTFHh7C4qla7E52GYqMQk+LT6bsmPI8ZdCzxhbvUf2pDzyan4wYqW+3+qdCdfEwYyJ
         /rDcxf7K6HjQxfqB8SVvBFeVHrlLyNok2zNbaoR2T/dYxEoUAz3REjEjnP5RKtyJE+qA
         bVyA==
X-Forwarded-Encrypted: i=1; AJvYcCXjetfvSQBvBBVKzrl76+jLgyNAmoiHAuzphVGbaTrWYDumoQJ+bZdcFLYrZ8VWsPSV8bET7//vwJa9Dog=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoPIwNSzvPcCt0iVzyvunXywqM28VzmG+pOW4XMKyKB6rcY+Vn
	ECYmpYB7nJP5Ug2OKgLagHoRwKjr4qv+U5tApNFXJ++l07m7KUsaXCSCoKrAz1IsEu42dWUSUkc
	9QEfEPQ==
X-Google-Smtp-Source: AGHT+IEZVi9081t8P5vrHL2wqYempVI6Tx7zpqovib+RLuWBI7X+sbJ0kRsI9o9ftmy+87K0NaMr6bmxbc5u
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:2e88:b0:dfa:8ed1:8f1b with SMTP
 id 3f1490d57ef6-e24d7352858mr4336276.1.1727212857200; Tue, 24 Sep 2024
 14:20:57 -0700 (PDT)
Date: Tue, 24 Sep 2024 21:19:54 +0000
In-Reply-To: <20240924212024.540574-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240924212024.540574-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240924212024.540574-13-mmaurer@google.com>
Subject: [PATCH v4 12/16] module: Reformat struct for code style
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, Matthew Maurer <mmaurer@google.com>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Using commas to declare struct members makes adding new members to this
struct not as nice with patch management.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/internal.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index 2ebece8a789f..daef2be83902 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -80,7 +80,12 @@ struct load_info {
 	unsigned int used_pages;
 #endif
 	struct {
-		unsigned int sym, str, mod, vers, info, pcpu;
+		unsigned int sym;
+		unsigned int str;
+		unsigned int mod;
+		unsigned int vers;
+		unsigned int info;
+		unsigned int pcpu;
 	} index;
 };
 
-- 
2.46.1.824.gd892dcdcdd-goog



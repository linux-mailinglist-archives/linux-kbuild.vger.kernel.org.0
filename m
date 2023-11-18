Return-Path: <linux-kbuild+bounces-48-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CD07EFD55
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Nov 2023 03:58:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C3F3B20B71
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Nov 2023 02:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D775687;
	Sat, 18 Nov 2023 02:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cFpJc1uG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5757E1720
	for <linux-kbuild@vger.kernel.org>; Fri, 17 Nov 2023 18:58:14 -0800 (PST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5c88b8b5367so14204737b3.2
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Nov 2023 18:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700276293; x=1700881093; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nvk9Q6fDi4VYvpZBd2dg6YVoVQRX3tnrrY9vqXNqK/Y=;
        b=cFpJc1uGrK0L9IEqMQ1f7XN8NnqWZD/2zkqP2j9JqCDvFOlV5c90qC0MoFUkNlBATj
         /hMF2V4bt/rf45dVNejfFaVYgvo38gE882Zv6Pyqg0IMerwFg6bFBkh6aKJUNpSHgKMP
         qCSolDJ4azR4YU3wUTANt0khbIdLSMJgmhVUCVDGcGWWj5JCBCulIDcj+dYI5YeKz42U
         Ex2mse2bptK9oWhVPS+XF2g49ipbKQfqSezHOwdNa4ooDxNWq+68hTgAtPAT3apZE33g
         a1871CLMq7R9B1w+ApX3yO1BTw6xHUWTkOZNgsUuMRMGcw11fKFuAQpoDAFIbYjiYEb/
         fXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700276293; x=1700881093;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nvk9Q6fDi4VYvpZBd2dg6YVoVQRX3tnrrY9vqXNqK/Y=;
        b=hbPPBhWZgnBNj2gonxKlBPh/CFUYP1YL4/6XzyrrGyAsgxAYZEC1XqE6SXYC7bJOrE
         VU/uKA6mXKrrFxV7VW+05rOE0zZCMeiSAVdKmScac1NiC3gAnNyMitI9kWFMAHnKx8rm
         BTaMr4eSMmzTT5Rqpzj1gAvU7yiNYkl4Mbn4DnXfltBF73w2NKlPjl1vGUpAKFU5BXXl
         93oyKZ+sQ2n9CYgUKfUwNFP3ZNtwDzV/3A08hPRsPZimSZ/+T+Yw6cchi9KMhT6c7jiW
         O7Ezh5g//ieZS9B07urne4Y/yPmcGGS0HEqzL2e9C4aChYLiY5NisN0FNfl244WnpXgr
         0owA==
X-Gm-Message-State: AOJu0YzErQjIme72Vu/c/+m3U0MCBrrSDNPRTGzB7REZOEC737zXJWZP
	mU+Ljp5fORvN1X1hU5bqfTn8+iXA5I7w
X-Google-Smtp-Source: AGHT+IGP3XlXj/5Dcw3hp9Px56ng9u8ZBGdlOpNsgMCWjyW3JuNS4KY9Ymdo28sfT5+B96al0+/x10TRijqM
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a81:d512:0:b0:5a8:d81f:f5e7 with SMTP id
 i18-20020a81d512000000b005a8d81ff5e7mr38384ywj.8.1700276293608; Fri, 17 Nov
 2023 18:58:13 -0800 (PST)
Date: Sat, 18 Nov 2023 02:54:45 +0000
In-Reply-To: <20231118025748.2778044-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231118025748.2778044-1-mmaurer@google.com>
X-Mailer: git-send-email 2.43.0.rc0.421.g78406f8d94-goog
Message-ID: <20231118025748.2778044-5-mmaurer@google.com>
Subject: [PATCH v2 4/5] rust: Allow MODVERSIONS
From: Matthew Maurer <mmaurer@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Luis Chamberlain <mcgrof@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Laura Abbott <laura@labbott.name>, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="UTF-8"

With variable length symbol names from extended modversions, we can
enable MODVERSIONS alongside RUST due to support for its longer symbol
names.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 init/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index 9ffb103fc927..6cac5b4db8f6 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1885,7 +1885,6 @@ config RUST
 	bool "Rust support"
 	depends on HAVE_RUST
 	depends on RUST_IS_AVAILABLE
-	depends on !MODVERSIONS
 	depends on !GCC_PLUGINS
 	depends on !RANDSTRUCT
 	depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
-- 
2.43.0.rc0.421.g78406f8d94-goog



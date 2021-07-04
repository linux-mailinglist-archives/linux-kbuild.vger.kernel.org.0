Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6F513BAF00
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Jul 2021 22:30:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbhGDUcl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Jul 2021 16:32:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:37756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230088AbhGDUcW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Jul 2021 16:32:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 52FEB611F2;
        Sun,  4 Jul 2021 20:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625430587;
        bh=DKa8oPhQvPF9g1pq2L8TrUitL6QrOQFoL1uiJ91d/i4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ie9Ei8HkRWaEArDA7NZ8TEUPtawa8jFEUUvivQcDDurHedqC8Y4mu4A90N39hwLB6
         Z2BuFqpz83j/YpdDfW9BanJCmPPvxAAbbVQ4wX/k4wMdWjQSXQkPJNgrT+dnIgd4MZ
         dRrTak61pInUkKbMixBKDDtx+vpUSszLw2P9HOe9q2S5DK9aT0UgR5d4zmdjmx2gQA
         cQ0vA7CfasicHkFZbsTmJmeYijCxzIDkEbokU4oxatv4U6Rey3fuwKzy/lah8S2S+P
         85evyIwTQAysplNyEU64jQzxo+YtGKiOz6hQcX3UsaucS8IIrx9cgj2D/Jv59okZvS
         2Z+9VSzsx1xrQ==
From:   ojeda@kernel.org
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Subject: [PATCH 16/17] MAINTAINERS: Rust
Date:   Sun,  4 Jul 2021 22:27:55 +0200
Message-Id: <20210704202756.29107-17-ojeda@kernel.org>
In-Reply-To: <20210704202756.29107-1-ojeda@kernel.org>
References: <20210704202756.29107-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Miguel Ojeda <ojeda@kernel.org>

Miguel, Alex and Wedson will be maintaining the Rust support.

Co-developed-by: Alex Gaynor <alex.gaynor@gmail.com>
Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>
Co-developed-by: Wedson Almeida Filho <wedsonaf@google.com>
Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0cce91cd562..a439204d9be 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15894,6 +15894,20 @@ L:	linux-rdma@vger.kernel.org
 S:	Maintained
 F:	drivers/infiniband/ulp/rtrs/
 
+RUST
+M:	Miguel Ojeda <ojeda@kernel.org>
+M:	Alex Gaynor <alex.gaynor@gmail.com>
+M:	Wedson Almeida Filho <wedsonaf@google.com>
+L:	rust-for-linux@vger.kernel.org
+S:	Supported
+W:	https://github.com/Rust-for-Linux/linux
+B:	https://github.com/Rust-for-Linux/linux/issues
+T:	git https://github.com/Rust-for-Linux/linux.git rust-next
+F:	rust/
+F:	samples/rust/
+F:	Documentation/rust/
+K:	\b(?i:rust)\b
+
 RXRPC SOCKETS (AF_RXRPC)
 M:	David Howells <dhowells@redhat.com>
 M:	Marc Dionne <marc.dionne@auristor.com>
-- 
2.32.0


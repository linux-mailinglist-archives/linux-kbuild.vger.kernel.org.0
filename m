Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4900D35FB06
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Apr 2021 20:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353061AbhDNSrg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 14:47:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:49592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353106AbhDNSrZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 14:47:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6ED6261179;
        Wed, 14 Apr 2021 18:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618426023;
        bh=fbtsIdtkdFxfnVdrwWFEg6BGYq8OVjveswa3IDqt6g0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UZZ0WH3q5XBtGlGfdPohuJbdn1qJ4IkamwoIe0C9c0NGEeDNIZTEybCX1tFwAJahz
         dhMcY9RZo5VZ4rco0qj/2/uhb7PE4cxTYf7vdnCmc6p95P+kJ5fZXsGR+FzwJgYMur
         QGandydDnucpr2JzSaeOfuFQa6Zu3+oFU6waN49oe/Ki/llwvHmLAtcIMpuou5zAdT
         qv85W0EjYg1FomSda6ak9GAiXiivSecAXaAYPcDqYFiKtXQTVev2wM4az72fWT+KNo
         /WvqbtfvbwlK6LywYm9p5vxA+sx0k2+jwI9CdOD12ZnFrHauTfOF/cLJ8OJ8JSxQXb
         KebglzhmlDSrw==
From:   ojeda@kernel.org
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Subject: [PATCH 11/13] MAINTAINERS: Rust
Date:   Wed, 14 Apr 2021 20:46:02 +0200
Message-Id: <20210414184604.23473-12-ojeda@kernel.org>
In-Reply-To: <20210414184604.23473-1-ojeda@kernel.org>
References: <20210414184604.23473-1-ojeda@kernel.org>
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
index 9e876927c60d..de32aaa5cabd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15547,6 +15547,20 @@ L:	linux-rdma@vger.kernel.org
 S:	Maintained
 F:	drivers/infiniband/ulp/rtrs/
 
+RUST
+M:	Miguel Ojeda <ojeda@kernel.org>
+M:	Alex Gaynor <alex.gaynor@gmail.com>
+M:	Wedson Almeida Filho <wedsonaf@google.com>
+L:	rust-for-linux@vger.kernel.org
+S:	Maintained
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
 L:	linux-afs@lists.infradead.org
-- 
2.17.1


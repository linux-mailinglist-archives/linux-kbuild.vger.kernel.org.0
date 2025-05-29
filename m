Return-Path: <linux-kbuild+bounces-7306-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A73AC82E0
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 May 2025 21:46:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5EAD3A7516
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 May 2025 19:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36AABE55B;
	Thu, 29 May 2025 19:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NeKpwcxr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B102327A7
	for <linux-kbuild@vger.kernel.org>; Thu, 29 May 2025 19:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748548007; cv=none; b=m8NFx2KAUqlij1CvZRoKODVDC9qg0gdTRafLKTPBgjv5VRcYfbGQPwC6c/rBMc6c1/CYMv5+fXyNYYTj333Oxnv20fnaigIxsvCRM3/qYN2aciREJG5SFEHkfgRX9YMXAqv2RN+Ne4MC+424IPoLUpen3MXSzlfAtDmEWqgmH1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748548007; c=relaxed/simple;
	bh=ZKXxZGgCU7BP+mFVZgZNXjLMVLktvoOhfY6WqzrLi3A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=egEUVn9GNYq59jBZPUBQ4L3AWjAGo1NKDoblO4fJTAxd8xAr7So1gFL12qD8WYl4FDJdNsQUU6sGVUYK1z4fdyQ/fm8plZacGWsvkC+oJ4bjZ3bFacjwqbVLB/WCdsUTnzDILaNFFNmphaO2yXa+S5ECRyNhUT/mnBzC7pyooJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NeKpwcxr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748548004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TACIyQDItLoNpGrrPA0+1cb6qtW03WnHpQbYTlxJqqY=;
	b=NeKpwcxr67tbogXIGpAvSXrzJNSKqC6beG3ubFrgJzDu3JMk+uiPkb2YEROHjALA+zJFDe
	oVXcNd1Wn9PIFnZKStS/a/f8aew4C2sD3yEzbclwxZzQSWW++Fks9coI5xKaU0AXkrvnMb
	OcYs3FucHrnHivuvHgE+kE6q8VJ5QEY=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-357-pQoLRzblPr-7MCea7SOY9Q-1; Thu,
 29 May 2025 15:46:42 -0400
X-MC-Unique: pQoLRzblPr-7MCea7SOY9Q-1
X-Mimecast-MFC-AGG-ID: pQoLRzblPr-7MCea7SOY9Q_1748548001
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CC00F1954207
	for <linux-kbuild@vger.kernel.org>; Thu, 29 May 2025 19:46:41 +0000 (UTC)
Received: from dev64.shokupan.com (unknown [10.64.240.10])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 75DDA19560A7;
	Thu, 29 May 2025 19:46:40 +0000 (UTC)
From: Masatake YAMATO <yamato@redhat.com>
To: linux-kbuild@vger.kernel.org
Cc: yamato@redhat.com
Subject: [PATCH] scripts/tags.sh: allow to use alternative ctags implementation
Date: Fri, 30 May 2025 04:46:33 +0900
Message-ID: <20250529194633.3029895-1-yamato@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Some ctags implementations are available. With this change, You can
specify your favorite one with CTAGS environment variable.

Signed-off-by: Masatake YAMATO <yamato@redhat.com>
---
 scripts/tags.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 98680e9cd7be..99ce427d9a69 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -344,7 +344,7 @@ case "$1" in
 
 	"tags")
 		rm -f tags
-		xtags ctags
+		xtags ${CTAGS:-ctags}
 		remove_structs=y
 		;;
 
-- 
2.49.0



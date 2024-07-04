Return-Path: <linux-kbuild+bounces-2386-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33080927DE4
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 21:37:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD93F284854
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 19:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E341913DBBD;
	Thu,  4 Jul 2024 19:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PzCb9dAk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86E613C905
	for <linux-kbuild@vger.kernel.org>; Thu,  4 Jul 2024 19:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720121818; cv=none; b=OY/iHedc+17vWpK8iY1RLPuTti02j4beLcnqNkk3M+/HU9ovOGMe86acwYyIIHsx0Am5zlEWJMaoG+6nGwqyj07s181jNkbT3y3+Q/mpSY/CnUk6sziPqK9M09oTUE4Yj4rhP5SrwmUVLU2rbYJu43RDlEuxEjrIR9NKjXWcggc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720121818; c=relaxed/simple;
	bh=t9ofOP0ze4UGyGJ8kmTyeN6SMDorzz2HRfkn0CJ0UCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cJok1NBU3tiJzKl5tmgBbDdJ3E7VjltG+XG8ylMIbShGdo5wCWy1+oArDi6SumlyPooUJozfxK4VhHn9k3xLPdGZV9wALMmwychpfUhiBrUdqRI9gPuGGyns8Y9bfMa0uqaGFexMp0slqkhJh0eiUFZJTlw0fxFUYt9aVgmm44M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PzCb9dAk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720121815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e2mM608hXRB0tkzS3eDg++O9P9yskvc9elF7/0eVFFw=;
	b=PzCb9dAk5GljoiFr0uUZ+Vnt3C4SzOdEwmmIaYsiUaLkSCbnH8fmIg37MadmWAGefDZ+da
	p3TNR6ffs2xRnE5hiwWzt3b0hncsf5TlfyWhLRNcguAZzErsoPk0JreYQ63LtAGauTcAUu
	UJkp/tzZUyH+Z5NJ9t2iVXvyNpP2Znk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-524-0t6-TQvWO66YqMRUsHwbWg-1; Thu,
 04 Jul 2024 15:36:52 -0400
X-MC-Unique: 0t6-TQvWO66YqMRUsHwbWg-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 154F71955F3B;
	Thu,  4 Jul 2024 19:36:51 +0000 (UTC)
Received: from optiplex-lnx.redhat.com (unknown [10.22.9.99])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C2F7B1956046;
	Thu,  4 Jul 2024 19:36:48 +0000 (UTC)
From: Rafael Aquini <aquini@redhat.com>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	aquini@redhat.com
Subject: [PATCH v2 2/2] kbuild: rpm-pkg: introduce a simple changelog section for kernel.spec
Date: Thu,  4 Jul 2024 15:36:42 -0400
Message-ID: <20240704193642.1929491-1-aquini@redhat.com>
In-Reply-To: <CAK7LNAQba5CDetpwevSoaOLJ21s1tO9ZHh=7gJpPCNK0AnHfJw@mail.gmail.com>
References: <CAK7LNAQba5CDetpwevSoaOLJ21s1tO9ZHh=7gJpPCNK0AnHfJw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Fix the following rpmbuild warning:

  $ make srcrpm-pkg
  ...
  RPM build warnings:
      source_date_epoch_from_changelog set but %changelog is missing

Signed-off-by: Rafael Aquini <aquini@redhat.com>
---
v2: move the changelog stub generator to mkspec (masahiroy)

 scripts/package/mkspec | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index ce201bfa8377..6abbfef700fd 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -28,3 +28,25 @@ cat<<EOF
 EOF
 
 cat "${srctree}/scripts/package/kernel.spec"
+
+# collect the user's name and email addr for the changelog entry
+if [ "$(command -v git)" ]; then
+	name=$(git config user.name) || true
+	email=$(git config user.email) || true
+fi
+
+if [ ! "${name:+set}" ]; then
+	name=${KBUILD_BUILD_USER:-$(id -nu)}
+fi
+
+if [ ! "${email:+set}" ]; then
+	buildhost=${KBUILD_BUILD_HOST:-$(hostname -f 2>/dev/null || hostname)}
+	email="${name}@${buildhost}"
+fi
+
+cat << EOF
+
+%changelog
+* $(LC_ALL=C; date +'%a %b %d %Y') ${name} <${email}> - ${KERNELRELEASE}
+- Custom built Linux kernel.
+EOF
-- 
2.45.1



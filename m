Return-Path: <linux-kbuild+bounces-2413-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 722989294C7
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jul 2024 18:45:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C0A3B21896
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jul 2024 16:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B84CF13B2BC;
	Sat,  6 Jul 2024 16:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UbzPWUaf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D4813B2A4
	for <linux-kbuild@vger.kernel.org>; Sat,  6 Jul 2024 16:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720284303; cv=none; b=slevCwYoxEEGmmL6KMaRsBgaM3+pwJ/Dvtk43nbm0oVBWQgFEVd5Ss/uCsNDcGQISAKtuXxTFgJMhd8PK8/VIgp5+92vSFWwqtShOrbNmrz2Fw2T8jNK/HZXoOzcdFEiIB/+JRZYghMdApTtAlFN2LHnmSry6+ISqjvWjh03Cgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720284303; c=relaxed/simple;
	bh=fcVi+G5fk6qpDDel7JfVpI22vwpPhkswMhck0/nEnic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CkBy47iAiMurTVNIfhq5lDXvNJ0Ns4PxhxXrAi/ZWvvO1zemA7Xn2SeCnHHa1lAW4z7SueLXR5ryWLwqzsjxtanNBLhNkfpXp7Rj/n9HimvUIRN8+mDhCD/sjiRvfaG5taHGSUfWEf/gAuSWwMVu+RsBF3oc9VF1/eVHpROOKsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UbzPWUaf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720284301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w+OayAN4XtlzDkGXDkDGBj96tW5MpqvXd9LH9Y0s11U=;
	b=UbzPWUafzTiQPx0y6nRxB270Ru1JMZ1rLkms3cmeDQeJrLzqOirFHYnKhMZd+AbNYYTQoM
	cUfzUAt6HeKa50YNjEEi32GMrAKkOFqqpZB3IbvjaBEALoL+DHjWfGFPRQCV5nCqD7rY9U
	dA0/ZDIVph3dtzSPeI/TaNWBPKpV0dM=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-457-qRwndmYXNrWAn82VLeYBUg-1; Sat,
 06 Jul 2024 12:44:52 -0400
X-MC-Unique: qRwndmYXNrWAn82VLeYBUg-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8418219560B1;
	Sat,  6 Jul 2024 16:44:50 +0000 (UTC)
Received: from optiplex-lnx.redhat.com (unknown [10.22.9.99])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5A1701955F40;
	Sat,  6 Jul 2024 16:44:47 +0000 (UTC)
From: Rafael Aquini <aquini@redhat.com>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	aquini@redhat.com
Subject: [PATCH v3 2/2] kbuild: rpm-pkg: introduce a simple changelog section for kernel.spec
Date: Sat,  6 Jul 2024 12:44:23 -0400
Message-ID: <20240706164423.1934390-1-aquini@redhat.com>
In-Reply-To: <CAK7LNASzX29R38ApwByCO3kpiY6-L5UqHnP1Vs2WRBQM8z+kQw@mail.gmail.com>
References: <CAK7LNASzX29R38ApwByCO3kpiY6-L5UqHnP1Vs2WRBQM8z+kQw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Fix the following rpmbuild warning:

  $ make srcrpm-pkg
  ...
  RPM build warnings:
      source_date_epoch_from_changelog set but %changelog is missing

Signed-off-by: Rafael Aquini <aquini@redhat.com>
---
 scripts/package/mkspec | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index ce201bfa8377..e45fdb12fbc7 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -28,3 +28,26 @@ cat<<EOF
 EOF
 
 cat "${srctree}/scripts/package/kernel.spec"
+
+# collect the user's name and email address for the changelog entry
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
+	builduser=${KBUILD_BUILD_USER:-$(id -nu)}
+	email="${builduser}@${buildhost}"
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



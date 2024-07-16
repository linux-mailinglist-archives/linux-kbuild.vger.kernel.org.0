Return-Path: <linux-kbuild+bounces-2556-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3871932672
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2024 14:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55C11B2285A
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2024 12:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1CEB199221;
	Tue, 16 Jul 2024 12:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="govz/R5V"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CA01E888
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jul 2024 12:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721132723; cv=none; b=S88rxUoRjbheraNxh/E2UAVeJ9JpG8+I4z6zDMsN3diHmKlFjiOWuHU8CMf4tIGZls5AhHp+1YE4WckUUl6b+vStULHKydwfgxoyWrg+YbYpCT9ecRuMRCubwmyUfkLj0zsrtaVpaj+hTtiPpYmNfRFZvJeguaCJMl4Ui8apxac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721132723; c=relaxed/simple;
	bh=7X3Q6kMoYSuYPGLywsgRzPkCAeCKJsWYSAYxiboZaRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GorB4LA1t6gQHQjtQwPw2u2rFGXpTRPXfQGL0FwIugg308vBAE4SZpNFOz+KWDx2JSOXKk8RU7wOCk7IR3BpjbB/cs7RNoYTH1Xb7jDt6R1HIHYCONmcHCJqbOHZe1aNASKHD3UxYv7+EkZIiYibfrei3hK+u3PGy2KNq/e2vLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=govz/R5V; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721132720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZFxmbw/5xcAyYcqY0SR3EeYmuRBqmmdDCEJu101udw0=;
	b=govz/R5V72dlKoI6y13243tf2eTMIklSz/ihrVH02hFzNAvIYPNgwqeNJ2KYzZk7KTW1Fi
	Uguu6Mm5nsBdeGEzQoDsrPTRY75lyZOmVgqroUdGJFydLwoJzhHWw7F/VREgYRaNi7bsQj
	MMiFLoo3JEhXup3bpNn5YEpt5s2FrNg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-311-aHv61f0TPYOGBJoFINxRlg-1; Tue,
 16 Jul 2024 08:25:17 -0400
X-MC-Unique: aHv61f0TPYOGBJoFINxRlg-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 844C81955D42;
	Tue, 16 Jul 2024 12:25:15 +0000 (UTC)
Received: from optiplex-lnx.redhat.com (unknown [10.22.32.250])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0BC9C300018E;
	Tue, 16 Jul 2024 12:25:12 +0000 (UTC)
From: Rafael Aquini <aquini@redhat.com>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	aquini@redhat.com
Subject: [PATCH v4 2/2] kbuild: rpm-pkg: introduce a simple changelog section for kernel.spec
Date: Tue, 16 Jul 2024 08:25:05 -0400
Message-ID: <20240716122505.3425582-1-aquini@redhat.com>
In-Reply-To: <CAK7LNAT_b6hmN4W94D_7o5XZAc7jYhBi5rp=GUE=y+_BHjccGQ@mail.gmail.com>
References: <CAK7LNAT_b6hmN4W94D_7o5XZAc7jYhBi5rp=GUE=y+_BHjccGQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

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
index ce201bfa8377..e8e01330266b 100755
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
+* $(LC_ALL=C; date +'%a %b %d %Y') ${name} <${email}>
+- Custom built Linux kernel.
+EOF
-- 
2.45.1



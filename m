Return-Path: <linux-kbuild+bounces-2088-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC483904620
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 23:12:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0E041C23441
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 21:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2CB154BEC;
	Tue, 11 Jun 2024 21:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O6ZSgRoc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36393153509
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Jun 2024 21:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718140320; cv=none; b=j6TUHy6x9L3WG5OlBrPVCv2V9f0QiuzrMmIEoafOEGagTwYJw7qRhcM+ODIuN8+NZ6N4fjbJzgs6TrKx4/fYZlr1xJkriYEq05L1Ma8pvZlH+5UNw7x9bQ+zKRIpzjDJH8LSdw+vmwFra0lYNO6TwWJCsWL4hdJeSYtlhWosfDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718140320; c=relaxed/simple;
	bh=Nmr+C12wF1RYYg9mmz1DcQEFznuFVjX6ABSCFL5q4fM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OigO9Z5qEX7I2JcHABOTKrls2U/0Q1ZeO+qc0GPQeradsZJvjM6vGPqi4VTIodPAqrQWfBR3nlz2/FJjbDd3KNC3Eo+CstS/dejqXkDvIbS7fO9r1gBrUmIpCBraIEpoYOcOGMZ66kx05A5iPyjpxnzJs8xVmt3cd9eaQQtjZ7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O6ZSgRoc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718140317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SlR2/lfVcOXnQva5QGCQYKDDAgBcAMAi4HJTFcXB9Zc=;
	b=O6ZSgRocX8W4+vMPsYLgQOFTtn27aVAcv1SG3FrOp9gRNqmmwcUsZhtl5HZe65CMVLSsSt
	jpwBwF14zjugOaPf3MMX5KLEuV9AuTsirOnlxm5Au1KL77MKEbRjqJtAcc3t6FfApQbvhT
	ZRtAK/bE3SqNgIU2BPJVtKRbAYFXfg0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-224-Yuu486_5MB-iIMM5KnThLw-1; Tue,
 11 Jun 2024 17:11:52 -0400
X-MC-Unique: Yuu486_5MB-iIMM5KnThLw-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8062F1956089;
	Tue, 11 Jun 2024 21:11:50 +0000 (UTC)
Received: from optiplex-lnx.redhat.com (unknown [10.22.17.224])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 499A719560AB;
	Tue, 11 Jun 2024 21:11:48 +0000 (UTC)
From: Rafael Aquini <aquini@redhat.com>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	aquini@redhat.com
Subject: [PATCH 2/2] kbuild: rpm-pkg: introduce a simple changelog section for kernel.spec
Date: Tue, 11 Jun 2024 17:11:22 -0400
Message-ID: <20240611211123.959459-3-aquini@redhat.com>
In-Reply-To: <CAK7LNATxSePzOrHaQvS1MQo4mpAwdfwrDu3iuUsYZ+RL=LiirA@mail.gmail.com>
References: <CAK7LNATxSePzOrHaQvS1MQo4mpAwdfwrDu3iuUsYZ+RL=LiirA@mail.gmail.com>
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
 scripts/package/kernel.spec | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
index 19e458341f45..126b23c1f6c2 100644
--- a/scripts/package/kernel.spec
+++ b/scripts/package/kernel.spec
@@ -132,3 +132,8 @@ fi
 /usr/src/kernels/%{KERNELRELEASE}
 /lib/modules/%{KERNELRELEASE}/build
 %endif
+
+%changelog
+* %(echo "$(LC_ALL=C; date +'%a %b %d %Y') $(git config --get user.name) \
+<$(git config --get user.email)>") - %{version}-%{release}
+- Custom built Linux kernel.
-- 
2.45.1



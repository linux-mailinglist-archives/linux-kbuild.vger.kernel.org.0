Return-Path: <linux-kbuild+bounces-2086-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E44BB904619
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 23:11:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AB7D2818BD
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 21:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FFBA150992;
	Tue, 11 Jun 2024 21:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PqvxOvsO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9B7386
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Jun 2024 21:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718140307; cv=none; b=h+Bt/bYgILA2IMwOwXPAoyzmFDop4cYqjnA9IpoWIvrSKx9HdvBrqpZgi80HV8U8qDWPDqSc0Nd+W79RR7WwSeHQf61JtqElxJLV6JvT/fmZQ12y6crDRLyp46izxRFfbWj56L51aizYw7G9qyKWFPZE3tZD5MQBTv3yBsJ4xyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718140307; c=relaxed/simple;
	bh=maB6CaHEx9s9SPvBuEwLIkR00dt0tjGNbYhSUkIz2VM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eFnW5QjCDkooxNHl0Nmbk41S2QewGgr7ctvyZ20v5GEXQcLJfGippFU1olPIwwn8sY4zPdMja7tb1/FQZBR+BvGd59DtBhFQ12TLOZSUd7T6xRJTr8W9F2h7aMX7pSwYVyt08jnhZd5ULu/OvDmpKWxYlkEdnWfs04QFEbBQ7hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PqvxOvsO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718140304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QNr+ss4QaS2MDribXW6MuNOxVlwStfChUH+ZQND479E=;
	b=PqvxOvsOnXjLTCpdWTfSWlJAf8CH3RpGv7y6DlGgEjPrL2awH0t+EBinpCY6LiovBaQafq
	MGJ2lcp+dCbi4vdwUpMFHZ/uOkM3bEHB0EIhn/q0Ao2nkoAeS37Ae6oFEy/JbCO5DAkcKs
	YsYmu4rK1VBggpZH9VSrRdPaBi+tjzs=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-499-W6VdvvwnN02kzPWpvwowzQ-1; Tue,
 11 Jun 2024 17:11:41 -0400
X-MC-Unique: W6VdvvwnN02kzPWpvwowzQ-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0DC0D19560AF;
	Tue, 11 Jun 2024 21:11:39 +0000 (UTC)
Received: from optiplex-lnx.redhat.com (unknown [10.22.17.224])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DC5E719560AB;
	Tue, 11 Jun 2024 21:11:36 +0000 (UTC)
From: Rafael Aquini <aquini@redhat.com>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	aquini@redhat.com
Subject: [PATCH 0/2] kbuild: rpm-pkg: fix rpmbuild warnings for kernel.spec
Date: Tue, 11 Jun 2024 17:11:20 -0400
Message-ID: <20240611211123.959459-1-aquini@redhat.com>
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

Newer revisions of rpmbuild are throwing warnings about the current
kernel.spec template having an unversioned kernel-headers in the
'Obsoletes:' field and not being able to source the epoch's date from
the spec's missing '%changelog' section:

  $ make srcrpm-pkg
    UPD     include/config/kernel.release
    GEN     rpmbuild/SPECS/kernel.spec
    UPD     .tmp_HEAD
    ARCHIVE linux.tar.gz
  rpmbuild -bs rpmbuild/SPECS/kernel.spec --define='_topdir /mnt/nfs/work/kernel/linux/rpmbuild'
  warning: line 34: It's not recommended to have unversioned Obsoletes: Obsoletes: kernel-headers
  warning: source_date_epoch_from_changelog set but %changelog is missing
  Wrote: /mnt/nfs/work/kernel/linux/rpmbuild/SRPMS/kernel-6.10.0_rc3-1.src.rpm

  RPM build warnings:
      line 34: It's not recommended to have unversioned Obsoletes: Obsoletes: kernel-headers
      source_date_epoch_from_changelog set but %changelog is missing

This patchset addresses both RPM build warnings.

Rafael Aquini (2):
  kbuild: rpm-pkg: make sure to have versioned 'Obsoletes' for kernel.spec
  kbuild: rpm-pkg: introduce a simple changelog section for kernel.spec

 scripts/package/kernel.spec | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
2.45.1



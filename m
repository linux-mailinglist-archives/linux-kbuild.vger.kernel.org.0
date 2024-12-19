Return-Path: <linux-kbuild+bounces-5186-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 597839F7552
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 08:24:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9730E18876C2
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 07:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 102C2524F;
	Thu, 19 Dec 2024 07:23:26 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6FC7082A;
	Thu, 19 Dec 2024 07:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.63.209.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734593006; cv=none; b=moA8u/+PT5t99LOvEJ5/UTrM73blvbs2khwOIVK7NjqpLBe69DY98RpD/SN/le6ohT/AM8Hqnd/JGvusYzwJfV0LxW9L6GfUlVZbcW+GfFRT/BOzLN+/2+HXtRJ+jNV/SlLNaN3S+ZVJMEN4bkz8kdcC4UWOxieCN28y9pX3Nag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734593006; c=relaxed/simple;
	bh=flm2R4EFoZlf5JkycqEWSAxk2tzk5iCAxcrfO4Os0A4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nae+VcU9RkxdB5shhw+KvWRMiNe/dhggEh3+3oWCRMwtVXCxRcjrNriXBfFGUcDXfUZLQ5PgEFzzvOYuD3+8IO1PHENqXrJ07gwfZQt4LVujfkp6Iz6e9VRi+uMr/XqtFz8pCgLyg3WT+9RMXuwLmCHfsyJPRrIdxmdGttQt36Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com; spf=pass smtp.mailfrom=emlix.com; arc=none smtp.client-ip=178.63.209.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emlix.com
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 6DBF35FA2D;
	Thu, 19 Dec 2024 08:23:11 +0100 (CET)
From: Rolf Eike Beer <eb@emlix.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] kconfig: qconf: remove overloaded constructor
Date: Thu, 19 Dec 2024 08:22:03 +0100
Message-ID: <2207289.irdbgypaU6@devpool47.emlix.com>
Organization: emlix GmbH
In-Reply-To: <5843611.DvuYhMxLoT@devpool47.emlix.com>
References: <5843611.DvuYhMxLoT@devpool47.emlix.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

No extra implementation is needed for this variant, provide a default argum=
ent
to the matching sibling instead.

Signed-off-by: Rolf Eike Beer <eb@emlix.com>
=2D--
 scripts/kconfig/qconf.h | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index 62ab3286d04f..1c90fec4c2da 100644
=2D-- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -114,7 +114,7 @@ public slots:
 class ConfigItem : public QTreeWidgetItem {
 	typedef class QTreeWidgetItem Parent;
 public:
=2D	ConfigItem(ConfigList *parent, ConfigItem *after, struct menu *m)
+	ConfigItem(ConfigList *parent, ConfigItem *after, struct menu *m =3D null=
ptr)
 	: Parent(parent, after), nextItem(0), menu(m), goParent(false)
 	{
 		init();
@@ -124,11 +124,6 @@ class ConfigItem : public QTreeWidgetItem {
 	{
 		init();
 	}
=2D	ConfigItem(ConfigList *parent, ConfigItem *after)
=2D	: Parent(parent, after), nextItem(0), menu(0), goParent(true)
=2D	{
=2D		init();
=2D	}
 	~ConfigItem(void);
 	void init(void);
 	void updateMenu(void);
=2D-=20
2.47.1


=2D-=20
Rolf Eike Beer

emlix GmbH
Headquarters: Berliner Str. 12, 37073 G=C3=B6ttingen, Germany
Phone +49 (0)551 30664-0, e-mail info@emlix.com
District Court of G=C3=B6ttingen, Registry Number HR B 3160
Managing Directors: Heike Jordan, Dr. Uwe Kracke
VAT ID No. DE 205 198 055
Office Berlin: Panoramastr. 1, 10178 Berlin, Germany
Office Bonn: Bachstr. 6, 53115 Bonn, Germany
http://www.emlix.com

emlix - your embedded Linux partner




Return-Path: <linux-kbuild+bounces-7644-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B36CFAE6A59
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:14:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C447D4A46FB
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48FC12E11A7;
	Tue, 24 Jun 2025 15:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l5uPISNw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206312E11A8;
	Tue, 24 Jun 2025 15:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777671; cv=none; b=EVhHCq/V/cYAt+t+giNHlEWgVmv12Eg3wEAiWZa1vKuPCW33hVLLiFEWO3y9YqXmGQ54HjcEkqt005QpaqONgLhsXJEvFeix7gOL2JJdtmCE8SADkNmTIR0Z+T6HRS01X+KHKmzDi1gZ9LFH7ns52B3InqBwH2MXArBeR5twLgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777671; c=relaxed/simple;
	bh=Dx6j4wazm09/lX6cbpWlD4pzsjTYFBVT2FF/S8nZ4Ag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M7A1MK2OMrNl47RCwoAYBP7pKuNKXtd0KrWGIloN81+RxwmAunBg5vDCuW1Xh0PZvduLisqhAS3Qv4Ln5RiWrMqw4o/C+IqQ28RfaAfQzYVAc615qXv5NKlXLrQWeMMpwzHGtIBqX4Vw6SuGZoB0OjWiJ+ZOc4GQJBg7s5xfN6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l5uPISNw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68FD1C4CEEE;
	Tue, 24 Jun 2025 15:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777670;
	bh=Dx6j4wazm09/lX6cbpWlD4pzsjTYFBVT2FF/S8nZ4Ag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l5uPISNwC+/P9j2vX3EVk2WTei5KF8/gLPpXnKznKvWnRkOp+2lUp8k9hYCT2VXzG
	 PSrnItqpq0cMQbWaQgqsYBXFZUMNMjqFT7oIQROSdHzga43ODR8zKwCh2FMafuL5Vs
	 rcFQH/VeSFh9zc2ppK1YgaSJmRHhM0L4AKHsW4fkaM+d0P3tfVmcEUI94X3sNMArD4
	 xR8Kn1ZyjVgvDlMiwD3aHpPGahMx2tWE72vk5VDwurUvhFIrQiFZzgpYcgsfDv5DQe
	 i/qFfQY5VTbi5SpRWgRAxyBJA0ewv7oyHwAJ4LmRZcNtsYLS1S3VvR6G/KGwdFG8d7
	 2mwvl2EnfGskw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 17/66] kconfig: gconf: remove internal-child="image" nodes from glade
Date: Wed, 25 Jun 2025 00:05:05 +0900
Message-ID: <20250624150645.1107002-18-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250624150645.1107002-1-masahiroy@kernel.org>
References: <20250624150645.1107002-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These nodes do not appear to serve anything useful.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.glade | 84 -------------------------------------
 1 file changed, 84 deletions(-)

diff --git a/scripts/kconfig/gconf.glade b/scripts/kconfig/gconf.glade
index aa483cb32755..19b80f2ec1ff 100644
--- a/scripts/kconfig/gconf.glade
+++ b/scripts/kconfig/gconf.glade
@@ -48,18 +48,6 @@
 		      <property name="use_underline">True</property>
 		      <signal name="activate" handler="on_load1_activate"/>
 		      <accelerator key="L" modifiers="GDK_CONTROL_MASK" signal="activate"/>
-
-		      <child internal-child="image">
-			<widget class="GtkImage" id="image39">
-			  <property name="visible">True</property>
-			  <property name="stock">gtk-open</property>
-			  <property name="icon_size">1</property>
-			  <property name="xalign">0.5</property>
-			  <property name="yalign">0.5</property>
-			  <property name="xpad">0</property>
-			  <property name="ypad">0</property>
-			</widget>
-		      </child>
 		    </widget>
 		  </child>
 
@@ -71,18 +59,6 @@
 		      <property name="use_underline">True</property>
 		      <signal name="activate" handler="on_save_activate"/>
 		      <accelerator key="S" modifiers="GDK_CONTROL_MASK" signal="activate"/>
-
-		      <child internal-child="image">
-			<widget class="GtkImage" id="image40">
-			  <property name="visible">True</property>
-			  <property name="stock">gtk-save</property>
-			  <property name="icon_size">1</property>
-			  <property name="xalign">0.5</property>
-			  <property name="yalign">0.5</property>
-			  <property name="xpad">0</property>
-			  <property name="ypad">0</property>
-			</widget>
-		      </child>
 		    </widget>
 		  </child>
 
@@ -93,18 +69,6 @@
 		      <property name="label" translatable="yes">Save _as</property>
 		      <property name="use_underline">True</property>
 		      <signal name="activate" handler="on_save_as1_activate"/>
-
-		      <child internal-child="image">
-			<widget class="GtkImage" id="image41">
-			  <property name="visible">True</property>
-			  <property name="stock">gtk-save-as</property>
-			  <property name="icon_size">1</property>
-			  <property name="xalign">0.5</property>
-			  <property name="yalign">0.5</property>
-			  <property name="xpad">0</property>
-			  <property name="ypad">0</property>
-			</widget>
-		      </child>
 		    </widget>
 		  </child>
 
@@ -121,18 +85,6 @@
 		      <property name="use_underline">True</property>
 		      <signal name="activate" handler="on_quit1_activate"/>
 		      <accelerator key="Q" modifiers="GDK_CONTROL_MASK" signal="activate"/>
-
-		      <child internal-child="image">
-			<widget class="GtkImage" id="image42">
-			  <property name="visible">True</property>
-			  <property name="stock">gtk-quit</property>
-			  <property name="icon_size">1</property>
-			  <property name="xalign">0.5</property>
-			  <property name="yalign">0.5</property>
-			  <property name="xpad">0</property>
-			  <property name="ypad">0</property>
-			</widget>
-		      </child>
 		    </widget>
 		  </child>
 		</widget>
@@ -244,18 +196,6 @@
 		      <property name="use_underline">True</property>
 		      <signal name="activate" handler="on_introduction1_activate" last_modification_time="Fri, 15 Nov 2002 20:26:30 GMT"/>
 		      <accelerator key="I" modifiers="GDK_CONTROL_MASK" signal="activate"/>
-
-		      <child internal-child="image">
-			<widget class="GtkImage" id="image43">
-			  <property name="visible">True</property>
-			  <property name="stock">gtk-dialog-question</property>
-			  <property name="icon_size">1</property>
-			  <property name="xalign">0.5</property>
-			  <property name="yalign">0.5</property>
-			  <property name="xpad">0</property>
-			  <property name="ypad">0</property>
-			</widget>
-		      </child>
 		    </widget>
 		  </child>
 
@@ -266,18 +206,6 @@
 		      <property name="use_underline">True</property>
 		      <signal name="activate" handler="on_about1_activate" last_modification_time="Fri, 15 Nov 2002 20:26:30 GMT"/>
 		      <accelerator key="A" modifiers="GDK_CONTROL_MASK" signal="activate"/>
-
-		      <child internal-child="image">
-			<widget class="GtkImage" id="image44">
-			  <property name="visible">True</property>
-			  <property name="stock">gtk-properties</property>
-			  <property name="icon_size">1</property>
-			  <property name="xalign">0.5</property>
-			  <property name="yalign">0.5</property>
-			  <property name="xpad">0</property>
-			  <property name="ypad">0</property>
-			</widget>
-		      </child>
 		    </widget>
 		  </child>
 
@@ -287,18 +215,6 @@
 		      <property name="label" translatable="yes">_License</property>
 		      <property name="use_underline">True</property>
 		      <signal name="activate" handler="on_license1_activate" last_modification_time="Fri, 15 Nov 2002 20:26:30 GMT"/>
-
-		      <child internal-child="image">
-			<widget class="GtkImage" id="image45">
-			  <property name="visible">True</property>
-			  <property name="stock">gtk-justify-fill</property>
-			  <property name="icon_size">1</property>
-			  <property name="xalign">0.5</property>
-			  <property name="yalign">0.5</property>
-			  <property name="xpad">0</property>
-			  <property name="ypad">0</property>
-			</widget>
-		      </child>
 		    </widget>
 		  </child>
 		</widget>
-- 
2.43.0



Return-Path: <linux-kbuild+bounces-5679-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6C4A2D76D
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Feb 2025 17:41:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F9BD1889881
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Feb 2025 16:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51BA01F3B99;
	Sat,  8 Feb 2025 16:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXY3HQOi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857111F3B97;
	Sat,  8 Feb 2025 16:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739032854; cv=none; b=i5DmNDf06gqKXiJn9IIUeyNwrB0S0bAffh7Iu8TAq1fsCjM/UDDJhGJYNYB//K0XCFrD8BZDmXurMO/K15GCVQY71Dhp4itHDStsZG25D9UajeCsXiEZkL0vMlB/WfQCKkKYlgHshh+BjOkOMbctD5anqpneOf1C4AxsB3gk3Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739032854; c=relaxed/simple;
	bh=NZQWB/8O/pABSLvkDGFliMDk/CDPZjx7dlzGJFJOsVU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k7UVRvzo7/rFN7ZL4C6HyH26Tcr3d3AYjaDVpjvfWgnxeK4rexi909CMB1JHrke0O44TCQvnrDAS13AHwwlRY9kXWpjPsResXI/O6VcloW4zGaEXH74RJIv5fuZ+7Oh5kpOgfRqsLzW3+mTlqNtHi4q4aceEmyo3G/5cGi2vGHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXY3HQOi; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab794ae3cf2so147251266b.2;
        Sat, 08 Feb 2025 08:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739032851; x=1739637651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQ5zjv0KRGetMajFc3IkL6hUkHKCs6bY73Rhz2RkOd4=;
        b=AXY3HQOiFhJloS27bsVb+ZuCdjD7Barr0jAOBfpJncSjWFXSyQK8W3bT4Mdg+VZECE
         1Nk5NNnX/Cy/qOMJzY3yZ+IjdM2kz/uOEm6IoogRsz7mLpSh0l5AIv6AlPcAhtR1DvVs
         mcrupBoMpDEvlGh5PFFcVBagM3OV0xeHCCY4qBBUSnw0y2Wex1T1Eyqgd4DQV2U/P/31
         Tg4Wq9B5XHDT2pFg52/GBtXxyHyBqSNKsBmcZ2Y+wsIiqAKLFUBq810dnR4GuK0f5yHN
         Y6pZPJk7cJ87ekOm4iSUA2RTQmyZe9ZxQbDp9mPP+Di38uRwuZ3ttEQ9cZxrh+Ag5m/o
         OFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739032851; x=1739637651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eQ5zjv0KRGetMajFc3IkL6hUkHKCs6bY73Rhz2RkOd4=;
        b=NgkPwLsBMTHJ3+1TyuJ09zgG4AuwJZbS9rjy1sWtx4TAud5SJwwDEv67uDagotrhb9
         Qr3y+g0Lv1C/3H0jfMNCCBozf7+twQfbiSuNmYUClK0cJ8PSeucCHweFsWCGjlGIWwVj
         Hewom4MjkbdizXmA/Yd/DlKaGSLx53JkEXQE28Olw1QdN/fq1tpDtajV6qcVXa3zqLa3
         BooPYeWW5tWGW7lfoyEhQRCP4M9irMDtXrzR+4B5y9GX7s7KEZS0MZCw+G+1SyZGqVrd
         4AVHDuHWo9NMSYBBr6LAW6JRsTAQv3FvYLJAscADOZ7OZ5xjkUwDV/6HDVgehSMnD/GN
         Zbvg==
X-Forwarded-Encrypted: i=1; AJvYcCXn2E3JLd17iUaOBIWn/HNr03afMqpG5gcC4TDyDg9y9hMCOtqWN8zpqBAX4taUseS2hS91n1/gsIpVKIw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfvbb2F1vYiq7Eejc8DU2RWHrcvxBQqgvXDZYRTMzRu/OBfpuC
	dRVS9RtYQf0sRYeIv9ZxJLJf6chArTnHBKd2erOEp7dYPydfiKO3I/nFhw==
X-Gm-Gg: ASbGncub8Ug5IUA+59W7lZI50MqLHOmuu0oQvrJNmFV4n+UYZF9QuhKsc/69AqbKkjt
	yzO9/aBrvs7/BdsYC4FkEBtyDopR5l8zcirN5mpkTgrR7KUFbXjFolwGZV3AscI7el16OWoTple
	CWAmVplMyTNn8cWo5kXUS4wFh9aVqNwgqsf/29v9Jt2OL8fTBa2rW6hml6P0jd88QvWIatgfiAm
	LqIxJIpRHSZFBQmtNzIAs+MpeuSvq4MbMpBbCe7oL+oYBMyFaCCv6nxiRAPz7l9OROp3V4vZCOq
	PtnLhGuaZXSxJfRLjXVze1odsl7k0w==
X-Google-Smtp-Source: AGHT+IE7iRvnLbtQOBBohb/TEeQCCMkIB9F32YfC+a1kcNPSJRKNStKrmEGpMgr74uC1ZuiEePW9Jg==
X-Received: by 2002:a17:907:97c6:b0:ab7:10e1:8779 with SMTP id a640c23a62f3a-ab789aef873mr878828766b.27.1739032850563;
        Sat, 08 Feb 2025 08:40:50 -0800 (PST)
Received: from localhost.localdomain ([2a02:908:e842:bf20:e115:64e7:5d6:176])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab773337f3dsm501539166b.139.2025.02.08.08.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 08:40:50 -0800 (PST)
From: Ole Schuerks <ole0811sch@gmail.com>
To: linux-kbuild@vger.kernel.org
Cc: ole0811sch@gmail.com,
	jude.gyimah@rub.de,
	thorsten.berger@rub.de,
	deltaone@debian.org,
	jan.sollmann@rub.de,
	mcgrof@kernel.org,
	masahiroy@kernel.org,
	linux-kernel@vger.kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu
Subject: [PATCH v7 03/11] kbuild: Add list_count_nodes and list_for_each_entry_from
Date: Sat,  8 Feb 2025 17:39:51 +0100
Message-Id: <20250208163959.3973163-4-ole0811sch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250208163959.3973163-1-ole0811sch@gmail.com>
References: <20250208163959.3973163-1-ole0811sch@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

list_count_nodes and list_for_each_entry_from exist in
include/linux/list.h. Add them to scripts/include/list.h.

Signed-off-by: Ole Schuerks <ole0811sch@gmail.com>
---
 scripts/include/list.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/scripts/include/list.h b/scripts/include/list.h
index 8bdcaadca709..b60f1cc878f1 100644
--- a/scripts/include/list.h
+++ b/scripts/include/list.h
@@ -219,6 +219,20 @@ static inline int list_empty(const struct list_head *head)
 	return head->next == head;
 }
 
+/**
+ * list_count_nodes - count nodes in the list
+ * @head:	the head for your list.
+ */
+static inline size_t list_count_nodes(struct list_head *head)
+{
+	size_t count = 0;
+
+	for (struct list_head *pos = head->next; pos != head; pos = pos->next)
+		++count;
+
+	return count;
+}
+
 /**
  * list_entry - get the struct for this entry
  * @ptr:	the &struct list_head pointer.
@@ -310,6 +324,18 @@ static inline int list_empty(const struct list_head *head)
 	     !list_entry_is_head(pos, head, member);			\
 	     pos = n, n = list_next_entry(n, member))
 
+/**
+ * list_for_each_entry_from - iterate over list of given type from the current point
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Iterate over list of given type, continuing from current position.
+ */
+#define list_for_each_entry_from(pos, head, member)			\
+	for (; !list_entry_is_head(pos, head, member);			\
+	     pos = list_next_entry(pos, member))
+
 /*
  * Double linked lists with a single pointer list head.
  * Mostly useful for hash tables where the two pointer list head is
-- 
2.39.5



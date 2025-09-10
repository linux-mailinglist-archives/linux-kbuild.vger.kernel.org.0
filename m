Return-Path: <linux-kbuild+bounces-8796-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8EDB50B74
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Sep 2025 04:45:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C1A24E1597
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Sep 2025 02:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A85C9263F52;
	Wed, 10 Sep 2025 02:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PxVgxLWf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D39D257834
	for <linux-kbuild@vger.kernel.org>; Wed, 10 Sep 2025 02:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757472244; cv=none; b=uHdIWn2+jbKs+vGdJOOQwlH+W7ACx3zdvrkpogy7iPVltv4EY87T3nbfi5A/sysrmz+QIghOrL7WgLNkcwf66LiB+GfyEGoaW/7ByaGDwMMqbn9adVqNpfib1Q2lS7qmLYsBvN3ldQa4KwUZq1fuTrxEhZjZwUDxp7xObu2exI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757472244; c=relaxed/simple;
	bh=Rg8Js/mQ+ji0aVDnd3uUR+wPkIV7f8cZoyAXSG+WzrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NDVz2OY60vfHS/Jj63AUIlNO2Xp1WnlEl+RhZUkvoPPwtcm3fNgL+6CZOsSIp2ZdIc5jkjPc3GNd2cWWlr6STVbs824OahLYC3i0I3FRzLY2XVYcn+BsI3ZK5W2BTKdkswYstwBG0nch0A0vvChYCNoNU8ONbuevcJhvD9TGpdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PxVgxLWf; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-24cd340377dso41418595ad.1
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Sep 2025 19:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757472240; x=1758077040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=isRfEajvq74JD8Gx5JZkbk62qSgMtw6IJwcPrIolSGc=;
        b=PxVgxLWf3U234tS82N4GAdV+0xhF6nj35VAIVGDRzDZc5hWaA1brC3f5xkRQJ+Jfav
         AK82sFn2ToREyweFCXPBPQMUaBMGXG3LQ4/Whs98LeaBoHAAX7ZWmYRptE373ad/K/cd
         TWxqFgarkuB+OnMbyFHO77/BKq/C4oX9INQFb0UPotVkHJTK6hUVwslBj+6vamtGdYlt
         V0YwYRsRG2HgnBkuUc+R3iZDY7XI/k1aA+wtG1i7v6EvZ1fBDJduQ9ckOlT5UI8IllfE
         9Xyj+5ZuufvtGgLF9JrCk/t81ULsHjSAJHIe/ATQmoqUmENU7ezyvqqzd6cn6sMzBHp0
         2lUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757472240; x=1758077040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=isRfEajvq74JD8Gx5JZkbk62qSgMtw6IJwcPrIolSGc=;
        b=dKqgla0YXnolclZH4BcqtBC0phqbnvnQPHTxUmXufEKb10pnoEl1G21E649HH9+r57
         2mezSBJ7Z1tY3K2RwlZcWi/Fpi5EoqfkZoP+EfhE/6eM29agMk6AcEOsr8uWlFlLb/cr
         PGEGyKvAQYCTm/p5X2r6Y3GNDlYC2YwKuUQ2dveaSW/3XMjjEcqvhsXyGOIsoCMyNRo6
         ttE0O6iX7msBYBKAI4u5BXwKPYgMpOZr/SKPgiEWUOnOQ4xc5jEQkDQGOmlagz5nLTb8
         hbEab7omb3DntBU3MqeTuL3n6oaPyGEKVA8s1/ug1dS5b0+Cb2zs/wtCEO9grnzbuJJE
         LagQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZvmdBQX7gtpomEOD8lDESeVOCcbGaSQj3D0E2VRYy/34A7kS8VpuHP8deqcw3QsdK/4NwOzn1lovSTFY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzAn9OBSOLXj/hGKPtcmMy9xSEAgEdalKsB1UGFje4KeDrIGlu
	xo7l4DOQK9nxEiKzJNSIwwqoh0uc3r0JKJMV1Y/IhQ5mGDKV9f362MNI
X-Gm-Gg: ASbGnctDe8mp8YMBhglDw2+zAIHDQRT1M5ldItZscXrGzbRTDSD3QlpRO9JMDDPOP+w
	/dg/UBXhHfacwGjAx1AqKobTppOg61836pQh8qAXB6KhtfQtaPVEemrOa2JRa9CmYhBYdZyZxfI
	ATF4z876dE8GoCcwIoq9LNzde5CT5gWqT1TkOnrwc2fM3yRIiaVOLqPochapkO1IGh31SwXs9UC
	U6CsViZD+L0t7M/5gxnwSud/w4KFLO20zxykcKdWGm6HhKm9XIWD3fQpcvgnfTCyWtikXjzZXTA
	1nHvj4zHh6XF3xGwFd1mfPAuwqiHgsedaqbaiHUNV/15gU9fSCg5FvTrQTbqZfKa09HaDeQ39I1
	aV7qSpJWRa+wsPqEEKR/uo1N2lQ==
X-Google-Smtp-Source: AGHT+IFrrGtrsp5QApHqrAEsH4Lf99kNe3GTHl7qChWDynb5tQqdU4zGL9zb4NWW/Nh5w4cYNQSmBA==
X-Received: by 2002:a17:902:c943:b0:24e:8118:cc2f with SMTP id d9443c01a7336-251734f2edcmr195946635ad.59.1757472240373;
        Tue, 09 Sep 2025 19:44:00 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25a2ac085d8sm10840225ad.118.2025.09.09.19.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 19:43:58 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 4B76441F3D85; Wed, 10 Sep 2025 09:43:52 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux DAMON <damon@lists.linux.dev>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linux Power Management <linux-pm@vger.kernel.org>,
	Linux Block Devices <linux-block@vger.kernel.org>,
	Linux BPF <bpf@vger.kernel.org>,
	Linux Kernel Workflows <workflows@vger.kernel.org>,
	Linux KASAN <kasan-dev@googlegroups.com>,
	Linux Devicetree <devicetree@vger.kernel.org>,
	Linux fsverity <fsverity@lists.linux.dev>,
	Linux MTD <linux-mtd@lists.infradead.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>,
	Linux Kernel Build System <linux-kbuild@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>,
	Linux Sound <linux-sound@vger.kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Huang Rui <ray.huang@amd.com>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Perry Yuan <perry.yuan@amd.com>,
	Jens Axboe <axboe@kernel.dk>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	tytso@mit.edu,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Waiman Long <longman@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shay Agroskin <shayagr@amazon.com>,
	Arthur Kiyanovski <akiyano@amazon.com>,
	David Arinzon <darinzon@amazon.com>,
	Saeed Bishara <saeedb@amazon.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Alexandru Ciobotaru <alcioa@amazon.com>,
	The AWS Nitro Enclaves Team <aws-nitro-enclaves-devel@amazon.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Ranganath V N <vnranganath.20@gmail.com>,
	Steve French <stfrench@microsoft.com>,
	Meetakshi Setiya <msetiya@microsoft.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Bart Van Assche <bvanassche@acm.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jani Nikula <jani.nikula@intel.com>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: [PATCH v2 04/13] Documentation: amd-pstate: Use internal link to kselftest
Date: Wed, 10 Sep 2025 09:43:19 +0700
Message-ID: <20250910024328.17911-5-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910024328.17911-1-bagasdotme@gmail.com>
References: <20250910024328.17911-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=945; i=bagasdotme@gmail.com; h=from:subject; bh=Rg8Js/mQ+ji0aVDnd3uUR+wPkIV7f8cZoyAXSG+WzrA=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkHnihuCjbtUDpafXJnbOHtXRdvzJjhG/D0b9KEh6svl Jx1Ocjf0VHKwiDGxSArpsgyKZGv6fQuI5EL7WsdYeawMoEMYeDiFICJSHcx/FNfPsFU6huDt7vJ kh1V1uZRLxRT1SOqp3E8VV6+6XDdK15GhiW/r34XtloUdOCT982MLd7bz2VGXmhWZatxbn38c0u qDSMA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Convert kselftest docs link to internal cross-reference.

Acked-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/admin-guide/pm/amd-pstate.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/pm/amd-pstate.rst b/Documentation/admin-guide/pm/amd-pstate.rst
index e1771f2225d5f0..37082f2493a7c1 100644
--- a/Documentation/admin-guide/pm/amd-pstate.rst
+++ b/Documentation/admin-guide/pm/amd-pstate.rst
@@ -798,5 +798,4 @@ Reference
 .. [3] Processor Programming Reference (PPR) for AMD Family 19h Model 51h, Revision A1 Processors
        https://www.amd.com/system/files/TechDocs/56569-A1-PUB.zip
 
-.. [4] Linux Kernel Selftests,
-       https://www.kernel.org/doc/html/latest/dev-tools/kselftest.html
+.. [4] Documentation/dev-tools/kselftest.rst
-- 
An old man doll... just what I always wanted! - Clara



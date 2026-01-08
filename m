Return-Path: <linux-kbuild+bounces-10444-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E329ED02A9B
	for <lists+linux-kbuild@lfdr.de>; Thu, 08 Jan 2026 13:37:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2F201300DD88
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Jan 2026 12:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DEA42D0614;
	Thu,  8 Jan 2026 08:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QM/zloNZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F90F1EB9E1;
	Thu,  8 Jan 2026 08:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767861920; cv=none; b=mDEP2I8s9+uRK8IZM0wpchQeu6ZQy4aZfgJ/uaNisfb1O2CUKhhDzueftBCfpP2ZI8EJ2vkOrVwzAUFGCu71B2YaQ9X7Q0CzyByToSUGS1BrmuAvvzYGz6H7t8gcaJ37K0Ah1KIoZKEBxOL/cS5AfyxeHYxtDjmewhCQoG3h1Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767861920; c=relaxed/simple;
	bh=jGl0naiTX+/HDHhxWoxiOWiPxFcoAnQa4OUQREfNbl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Jt8no+5qPmRNXMnAwfZN87tZR/MA3hkwEzy7JFcI0zWAcAERq3BaPrxWcpqTSw5KoFJjfEyAUWdCdJVnQSydiN1jV+t6foOQRj5HACt8BYty3iN1XbT2nIMhlcQ3jWzYFtKVEWWAsLD5mcWesgvqIYTm1DDy2ZcK2S4r3IJh7Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QM/zloNZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6AC04C116D0;
	Thu,  8 Jan 2026 08:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767861918;
	bh=jGl0naiTX+/HDHhxWoxiOWiPxFcoAnQa4OUQREfNbl0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=QM/zloNZJrMlXlFOvB50pGGtwBfG/qvcakDAaQi+UgD8iqcuNUPePMMnFjHeLBgV9
	 +pveU9Uf7q1WgOO4PczxyP6ypah05aIXx8BObBsOlV820Myz5Wy0Z8pJ1ZYYuhLw5M
	 d4UrmVPbyQxUikjv2oSk/FSGHFD+0lD4OzesXoaSdn8QG9fIHvYQgz5kyi2ieaXeea
	 PF/aQdjdciekE5QCtjDySQylcGLB59BlYG3JeZxTLPyOBUUF4xlpDRsR4FfYrca9rH
	 +vwMlqfEJaETzKGP8Y2wDHH0/F/47BtaxwP+SoCfPU72vlksI9SOBfhi9cO48t1qA8
	 b1iCMiObVscXw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60A06CF6A87;
	Thu,  8 Jan 2026 08:45:18 +0000 (UTC)
From: Jihan LIN via B4 Relay <devnull+linjh22s.gmail.com@kernel.org>
Date: Thu, 08 Jan 2026 08:44:38 +0000
Subject: [PATCH] Documentation/kbuild: Document gendwarfksyms build
 dependencies
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-documents_gendwarfksyms-v1-1-52b1f9c38c70@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHVuX2kC/x3MSQqAMAxA0atI1hZqcb6KiBSbahCrNI6Id7e4f
 Iv/H2D0hAx19IDHg5gWF5DEEfSjdgMKMsGgpMplIjNhln6f0W3cDejMqb2d+J5ZVLYsMdWFNsp
 CqFePlq7/3LTv+wEPGta9aQAAAA==
X-Change-ID: 20260105-documents_gendwarfksyms-9f88e4a7ad2f
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Sami Tolvanen <samitolvanen@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jihan LIN <linjh22s@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767861915; l=2399;
 i=linjh22s@gmail.com; s=linjh22s_machine; h=from:subject:message-id;
 bh=Hr5ycYw2D6CoeYfL5AHxIhIwbrD9nhbsUBykKkGZxFo=;
 b=Qf7URpG3jkcQR7ZRLUMeJndMh+UWQzdYp1YASq18oNDU3mjDFAp9LQQBmrRBn6B5qKFKolmIL
 +SEjVVEX68NCLRcco4z613r1iPXqRGYH03iLsILewSqwGXTGncMdoZg
X-Developer-Key: i=linjh22s@gmail.com; a=ed25519;
 pk=MnRQAVFy1t4tiGb8ce7ohJwrN2YFXd+dA7XmzR6GmUc=
X-Endpoint-Received: by B4 Relay for linjh22s@gmail.com/linjh22s_machine
 with auth_id=592
X-Original-From: Jihan LIN <linjh22s@gmail.com>
Reply-To: linjh22s@gmail.com

From: Jihan LIN <linjh22s@gmail.com>

Although dependencies for gendwarfksyms were recently added to the
packaging rules [1-2], the corresponding documentation was missing.

Document the required build dependencies for gendwarfksyms, and
include a few examples for installing these dependencies on some
distributions.

[1] commit 657f96cb7c06 ("kbuild: deb-pkg: Add libdw-dev:native to
Build-Depends-Arch")
[2] commit 5bd6bdd0f76e ("kbuild: rpm-pkg: Add (elfutils-devel or
libdw-devel) to BuildRequires")

Fixes: f28568841ae0 ("tools: Add gendwarfksyms")
Signed-off-by: Jihan LIN <linjh22s@gmail.com>
---
Hi,

I found there is no documentation for build dependencies in gendwarfksyms
while digging into Rust drivers. Though Yuli added libdw-dev to the build
dependencies for packaging [1], it seems that there is no documentation
about it.

This patch documents the build dependencies of gendwarfksyms and adds a few
examples for installing these dependencies on some distributions.

[1]: https://lore.kernel.org/all/79C925DCE2E963FF+20250422104927.144252-1-wangyuli@uniontech.com/
---
 Documentation/kbuild/gendwarfksyms.rst | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/kbuild/gendwarfksyms.rst b/Documentation/kbuild/gendwarfksyms.rst
index ed366250a54eac3a72c2f529da94a9e803704ae4..85fe9086beb760500250e7539058dce515681378 100644
--- a/Documentation/kbuild/gendwarfksyms.rst
+++ b/Documentation/kbuild/gendwarfksyms.rst
@@ -14,6 +14,29 @@ selected, **gendwarfksyms** is used instead to calculate symbol versions
 from the DWARF debugging information, which contains the necessary
 details about the final module ABI.
 
+Dependencies
+-----
+
+libelf, libdw and zlib are dependencies of gendwarfksyms.
+
+Here are a few examples for installing these dependencies:
+
+* Arch Linux and derivatives::
+
+    sudo pacman --needed -S zlib libelf
+
+* Debian, Ubuntu, and derivatives::
+
+    sudo apt install libelf-dev libdw-dev zlib1g-dev
+
+* Fedora and derivatives::
+
+    sudo dnf install elfutils-libelf-devel elfutils-devel zlib-devel
+
+* openSUSE and derivatives::
+
+    sudo zypper install libelf-devel libdw-devel zlib-devel
+
 Usage
 -----
 

---
base-commit: f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
change-id: 20260105-documents_gendwarfksyms-9f88e4a7ad2f

Best regards,
-- 
Jihan LIN <linjh22s@gmail.com>




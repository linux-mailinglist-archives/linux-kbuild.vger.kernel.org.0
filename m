Return-Path: <linux-kbuild+bounces-10574-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C69DD1E92A
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jan 2026 12:55:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 76D5B30C2AC3
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jan 2026 11:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4EEE39A81C;
	Wed, 14 Jan 2026 11:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="StJIpipQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDBC397AC6;
	Wed, 14 Jan 2026 11:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768391300; cv=none; b=LjLnxZM0GGSHQCo4QbluQp+hi8oiS7FvFKd/V4nIWRiTO7+UjE9SodDNLPsv/G/rZuKGEwgXZKJtR27BjzAqMjP+zwoh64raul+JDMjpqESUaf9uRZveeO1tTJ5EHdh420NeTlncf8WHGdLrb8HwtUzWhfhYhLoSJ496Cij7N+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768391300; c=relaxed/simple;
	bh=0O1tF7Rx6B7NMUTJaBjAs7O/JZvQflj27dnVV/aS0Ds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WrTj44nFKGkF2DVjIR8vHXSngGyOxT8XAi+9WghXVNqainfIDPtsVsaupAtt8FZyPrUv/lcnGt9iG8ZiEH2l3RQc0L19+DxtO4bwpgea09fMUXEW+FtaCu1ZRICmUouCuyRXaaGxcoNflf+4Fone3f+TUkwX1wYmQsFkH3uYJnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=StJIpipQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36B75C16AAE;
	Wed, 14 Jan 2026 11:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768391300;
	bh=0O1tF7Rx6B7NMUTJaBjAs7O/JZvQflj27dnVV/aS0Ds=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=StJIpipQoDNgFUATVI+O9zBIFfboxc2ZsHkzyQdYITw+7bfo8yn+ssCTYeQIclF6T
	 v2ckFIjqiXYbhzSueGZ+HnVSeAHCw7QKMKtk/lOcVHHbzOG/qZznFUKrm3vYQ5higf
	 Dya2uLYg7VQRu4O+kCjpjno7l0wmfbLrHPAH/r4BhkmvzIDF6duCIpBj178GfakSV+
	 sLWDKdsZZlmwxC1kRpVui/+V43tlsf82WSz7Fq5CUiltxAFx3Ezl/cJ+idGar7Xuz6
	 Ma1ZxlpaHAbJKPX+QYI0GsB2+JKaq1HXV2Ay4ON4F0FU0EXXmdOInrNRO2eZhjlFjG
	 VdhSj860IXWiQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 246DFD29FF7;
	Wed, 14 Jan 2026 11:48:20 +0000 (UTC)
From: Jihan LIN via B4 Relay <devnull+linjh22s.gmail.com@kernel.org>
Date: Wed, 14 Jan 2026 19:47:44 +0800
Subject: [PATCH v2 1/2] Documentation/kbuild: Document gendwarfksyms build
 dependencies
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-documents_gendwarfksyms-v2-1-297c98bd62c6@gmail.com>
References: <20260114-documents_gendwarfksyms-v2-0-297c98bd62c6@gmail.com>
In-Reply-To: <20260114-documents_gendwarfksyms-v2-0-297c98bd62c6@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Sami Tolvanen <samitolvanen@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>
Cc: linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jihan LIN <linjh22s@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768391298; l=1690;
 i=linjh22s@gmail.com; s=linjh22s_machine; h=from:subject:message-id;
 bh=zaWdvli633/VK3S2KUL14PgYlfdPOQbClm+Z3p3BhUE=;
 b=kMzqRJLPJqr33VLRjq0RPNsdmz0bA0nnzM52+b1Yznalz4e6Xi+T+3tx9pdylN9m4W96yQ43T
 LXR12zdX+BGC5BlQJHChFfDCzW/e24NiHXQ2OmYFX8auZna93/Zztkr
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
Signed-off-by: Jihan LIN <linjh22s@gmail.com>
---
 Documentation/kbuild/gendwarfksyms.rst | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/kbuild/gendwarfksyms.rst b/Documentation/kbuild/gendwarfksyms.rst
index ed366250a54eac3a72c2f529da94a9e803704ae4..0e153d13b052da6edcf65950739730c123cd49db 100644
--- a/Documentation/kbuild/gendwarfksyms.rst
+++ b/Documentation/kbuild/gendwarfksyms.rst
@@ -14,6 +14,29 @@ selected, **gendwarfksyms** is used instead to calculate symbol versions
 from the DWARF debugging information, which contains the necessary
 details about the final module ABI.
 
+Dependencies
+------------
+
+libelf, libdw and zlib are dependencies of gendwarfksyms.
+
+Here are a few examples for installing these dependencies:
+
+* Arch Linux and derivatives::
+
+	sudo pacman --needed -S zlib libelf
+
+* Debian, Ubuntu, and derivatives::
+
+	sudo apt install libelf-dev libdw-dev zlib1g-dev
+
+* Fedora and derivatives::
+
+	sudo dnf install elfutils-libelf-devel elfutils-devel zlib-devel
+
+* openSUSE and derivatives::
+
+	sudo zypper install libelf-devel libdw-devel zlib-devel
+
 Usage
 -----
 

-- 
2.51.0




Return-Path: <linux-kbuild+bounces-3905-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5E398FE26
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Oct 2024 09:54:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC9C2B22DD4
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Oct 2024 07:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67C2E13957B;
	Fri,  4 Oct 2024 07:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=aaront.org header.i=@aaront.org header.b="ee06N8hq";
	dkim=pass (2048-bit key) header.d=aaront.org header.i=@aaront.org header.b="YXEcUGkF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out0.aaront.org (smtp-out0.aaront.org [52.10.12.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635C5136E30;
	Fri,  4 Oct 2024 07:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.10.12.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728028468; cv=none; b=tKUt89laZblTFVOdRJLXqeF956MyyNRENg6IbI6Ruh2kMRNS3JbXBxPXMIZK3MJc/tvPETY/TGn2KywL1A5ORJD/xes1JikKLgbPIgeW5djSGa0m7VZEjed+9vvQWZryRkWGyTOdtnVIP9HcEUzYRp4v1+sX5YuRmR7/Ba6j7ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728028468; c=relaxed/simple;
	bh=qORPxs4mzqrHXBfnJ5Tde3bukVXxkG6Qlh2Sy2bmh4Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MP+Sa2xN5A+7tBpkdJOU37iyBzWw5y44BeJQajt5x0tIvQmjw5bxvhck6UjEIyJwl7dhoFkOGQSxxtfxBC4sbHrCajh7eIg+9RpaRDX+EYylmwTTU8farGOAopQGje4+8AeJu/JYXn+NpecGMm0bb7BitocIbckjCxcc6rhEQQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aaront.org; spf=pass smtp.mailfrom=aaront.org; dkim=permerror (0-bit key) header.d=aaront.org header.i=@aaront.org header.b=ee06N8hq; dkim=pass (2048-bit key) header.d=aaront.org header.i=@aaront.org header.b=YXEcUGkF; arc=none smtp.client-ip=52.10.12.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aaront.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aaront.org
Received: by smtp-out0.aaront.org (Postfix) with ESMTP id 4XKgmd2mkczM7;
	Fri,  4 Oct 2024 07:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/simple; d=aaront.org;
    h=from:to:cc:subject:date:message-id:mime-version
    :content-transfer-encoding; s=bgzxjfijqntwovyv; bh=qORPxs4mzqrHX
    BfnJ5Tde3bukVXxkG6Qlh2Sy2bmh4Q=; b=ee06N8hq+qvPEKq8vB078smTMu6lL
    nbgOzp7ii/ezpqlDABwdbYsHZNaxYcnVPDu68IKSIKZm4Wty8MR4IkVDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aaront.org; h=
    from:to:cc:subject:date:message-id:mime-version
    :content-transfer-encoding; s=elwxqanhxhag6erl; bh=qORPxs4mzqrHX
    BfnJ5Tde3bukVXxkG6Qlh2Sy2bmh4Q=; b=YXEcUGkFWL9IA7osFRCP99TSwi+2/
    HffmtjX/mByCrZ2AHUFlnJ7EPc+0bDNEvAi7zYol+UwYzlW85kV2HfEkoAbULAli
    ezVfVUeO6anRkHJ/+yI+MP644UoCmjow0IFXS5mgVpPXOeUb2qDBKf7hV14OweJM
    0ZJxKhc0kVDL2YbJ7dNZ49BaPiXtCD0lWloygobgjMepEcOnlIJInD71mwHIw5Qy
    yDIx/x6+zpUzlveFvQ0xH3Fwx4nczjzelU2Nn/7KWsz7K9ecHmEonmLMNLQF7Yyy
    tVj7UqFU95VwNKdcY98JWKJXYV7zD8+SjmnBHivUDkOryiGK1Nb617eiA==
From: Aaron Thompson <dev@aaront.org>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Aaron Thompson <dev@aaront.org>
Subject: [PATCH] kbuild: deb-pkg: Remove blank first line from maint scripts
Date: Fri,  4 Oct 2024 07:52:45 +0000
Message-Id: <20241004075245.169046-1-dev@aaront.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aaron Thompson <dev@aaront.org>

The blank line causes execve() to fail:

  # strace ./postinst
  execve("./postinst", ...) = -1 ENOEXEC (Exec format error)
  strace: exec: Exec format error
  +++ exited with 1 +++

However running the scripts via shell does work (at least with bash)
because the shell attempts to execute the file as a shell script when
execve() fails.

Fixes: b611daae5efc ("kbuild: deb-pkg: split image and debug objects staging out into functions")
Signed-off-by: Aaron Thompson <dev@aaront.org>
---
 scripts/package/builddeb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index c1757db6aa8a..404587fc71fe 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -74,7 +74,6 @@ install_linux_image () {
 
 		mkdir -p "${pdir}/DEBIAN"
 		cat <<-EOF > "${pdir}/DEBIAN/${script}"
-
 		#!/bin/sh
 
 		set -e

base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
-- 
2.39.5



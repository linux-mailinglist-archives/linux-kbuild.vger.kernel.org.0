Return-Path: <linux-kbuild+bounces-9909-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E274C93044
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Nov 2025 20:28:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EDB6534D16C
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Nov 2025 19:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0370A2D63F2;
	Fri, 28 Nov 2025 19:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ldtDFqb0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72872080C8;
	Fri, 28 Nov 2025 19:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764358080; cv=none; b=XTuEEElZj0P1o6V9bxaXBRwm2JZMsGkWFTmPG/A+A0t0b+Z8emDKMnRlyTFg41EzVpLqcdgTV8+uZjg5NViq0AcR5/s9JmJNHOr9HWMLSoznDLTwAIM3igkzkVG+X9V0xLNZGDUg8fg+ZR8tNWORdLU16Dg7gxacNVbWrkqD2/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764358080; c=relaxed/simple;
	bh=5ld7PgGt2O6AfHtq2SKOj/MjG4zsn2catx5qeqE0cGg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ADWebFQp9rwgD3EZmk0XFcyxtPyI+vssixV9xxSa4KbygfIzH0DwEAaZGG11K8EN+cMj7cjMa9KXHdOPLCjMU6ils2BsOFpN+0ZOsN68rZRGELpW8kT9/8c1bX1s66KmCj/izKQ2A8RwEJblApvnqNIaN1u5pzM0JAa3nTqHv8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ldtDFqb0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 198D4C4CEF1;
	Fri, 28 Nov 2025 19:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764358079;
	bh=5ld7PgGt2O6AfHtq2SKOj/MjG4zsn2catx5qeqE0cGg=;
	h=From:Subject:Date:To:Cc:From;
	b=ldtDFqb0eOpn8chGlKju27Llguf3ujdHg1piNgO+CgaEssy30gtMM3HfCvyP+IAxG
	 Af8bDNyVK4gUhjkMEFT9H0bw5SDdGcJIrMjEP6inUBwQq0KETmu7uRIvEPv2TkjtQK
	 d/rhFxOAqipK8X0OgC2tFCFD8QQUCHYAE3dE76dNCy7NV0c98ukNWUyLGZs2rrMFZi
	 29rgTTdkoee1wx/QljK0u1Mi+IlrHkN5yfm0IyOVpTc6OGl4fU54+lnD6ywfohcJrx
	 OQ2Y85OtYpXVJ77xILEIN89LLEcqHJy8iWr45BQNH0uPxMngfCQuEPh3XAy663s1Dk
	 sP1ErfcBBK80w==
From: Nicolas Schier <nsc@kernel.org>
Subject: [PATCH 0/2] fortify: test_fortify.sh: Improve handling of tempfile
Date: Fri, 28 Nov 2025 20:27:56 +0100
Message-Id: <20251128-fortify-improve-handling-of-tempfile-v1-0-a79d0d3abcac@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALz3KWkC/x2N0QqDMAwAf0XyvMAanIz9ythDZhMNaFtSkQ3x3
 1f2eHDcHVDFTSo8ugNcdquWU4Nw6WCcOU2CFhsDXekWAt1Rs2+mX7S1eN4FmxQXSxNmxU3WorY
 IUiQeh/7NPTO0VHFR+/w3z9d5/gC50RvWdgAAAA==
X-Change-ID: 20251128-fortify-improve-handling-of-tempfile-2d2ac64ba4aa
To: Kees Cook <kees@kernel.org>
Cc: WangYuli <wangyuli@aosc.io>, WangYuli <wangyl5933@chinaunicom.cn>, 
 Nathan Chancellor <nathan@kernel.org>, linux-hardening@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Nicolas Schier <nsc@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
 Nicolas Schier <nicolas.schier@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764358080; l=879;
 i=nsc@kernel.org; s=20250924; h=from:subject:message-id;
 bh=5ld7PgGt2O6AfHtq2SKOj/MjG4zsn2catx5qeqE0cGg=;
 b=OsqFvu8hJ3WslkEhYY5iKsUz4Do0tooBDrbpbF9gv1PaphVhUidBI+I+5APiAB6DpXlW4bpAe
 qIvC4QB+QD3Ct/eQa3+smV7LyoyAvkk7X4CpXOPDIFNykr7yWRGZEE3
X-Developer-Key: i=nsc@kernel.org; a=ed25519;
 pk=+0ar7sBdSzOoVoXxW8B+48yZbV4azT4joSEm8UyP7z4=

WangYuli reported [1] that the temporary file created by test_fortify.sh
is recognised by git as untracked file, especially if it remains after
non-common exits of test_fortify.sh (e.g. killed by signal).

The following two patches handle that by renaming the temporary file and
by cleaning up the file in more situations.

Link: https://lore.kernel.org/linux-kbuild/20251112114725.287349-1-wangyuli@aosc.io/ # [1]
Signed-off-by: Nicolas Schier <nsc@kernel.org>
---
Nicolas Schier (2):
      fortify: Rename temporary file to match ignore pattern
      fortify: Cleanup temp file also on non-successful exit

 lib/test_fortify/test_fortify.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251128-fortify-improve-handling-of-tempfile-2d2ac64ba4aa

Best regards,
-- 
Nicolas



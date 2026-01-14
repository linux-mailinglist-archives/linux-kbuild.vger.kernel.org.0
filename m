Return-Path: <linux-kbuild+bounces-10575-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7B3D1E8CD
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jan 2026 12:51:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F090630383D5
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jan 2026 11:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE0E39B481;
	Wed, 14 Jan 2026 11:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O7o7XXLD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF40399000;
	Wed, 14 Jan 2026 11:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768391300; cv=none; b=r88PR4dvidbfRQAORNSI+Os93ZeGQNKtnmv/WFh/r3o5DBA/0Ju18f/W46Ixy5vdy+4izYcpSEaHAZvrrozyaNhnZNysGWWdfWjDOqqeKBBUbfJwVMpHCOqBIB9hUJszVg7n7F0yp5wAvsVi4fFwyKnbty3Z0O3K6aKkIEE+7fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768391300; c=relaxed/simple;
	bh=42b1jPMRaZQMJsFTcdIPsgOH+T5OPHq2ZKwWlPwIz44=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Kn4APzosVu3WC9ev/HCUwMogM7PkDvpfRsTBaM2TPpy7ES0NWOGnjMJY0v+YieFFl8NaK/DTiK5xUt+xukoajl5iCm6H+pfy03batffzJVsX8LNx7F/Ptp9GwxaodjtnvVmJdQuLB8CbUHT4tpZxH8XoYMTJOEvp2wRQClgRX+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O7o7XXLD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27719C2BC86;
	Wed, 14 Jan 2026 11:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768391300;
	bh=42b1jPMRaZQMJsFTcdIPsgOH+T5OPHq2ZKwWlPwIz44=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=O7o7XXLDaiYzs93VgV3RZzXPKw8S7HWiYG6LYTRdiab5rsryYJGtGvu83pUD27HqH
	 UGnQhxQBYLa8hINWTHg/40l7SwgvqXoHeNtJFEXEEqkvoG1GN0izO1162Eop4KJ/Yg
	 S93sQzZAUdfzelmDxpNQLBk1C4B7ZlbrFNzp+gmkliFS88xQLP5dlsZEyeLPCvh1+1
	 ylBJf2IygroDEGJhLbuns/wvqVzmKe9HKam8aA+AnvmI5q6E4eM/9j/kNaUsvOIt/l
	 3e/35M7LrkhESr8you8sU0ilwWOB5YLMqOZk4cCGmDLk9ceRo+2Mwtg6zqKEEZnYUy
	 Av2Mxhw3Wn0bQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10505D29FEA;
	Wed, 14 Jan 2026 11:48:20 +0000 (UTC)
From: Jihan LIN via B4 Relay <devnull+linjh22s.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] gendwarfksyms: Document build dependencies
Date: Wed, 14 Jan 2026 19:47:43 +0800
Message-Id: <20260114-documents_gendwarfksyms-v2-0-297c98bd62c6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF+CZ2kC/3WNQQ7CIBQFr9L8tRhAa6kr72Eag/BpiQIGarVpu
 LvYxKXLmeTNWyBhtJjgWC0QcbLJBl+AbypQg/Q9EqsLA6f8QBmtiQ7q6dCP6dKj1y8ZzS3NLpH
 WCIF72UjNDZT1I6Kx77V87goPNo0hzuvRxL721xR/mxMjjNT8ykyrdkI19NQ7ae9bFRx0OecPF
 /L5zr4AAAA=
X-Change-ID: 20260105-documents_gendwarfksyms-9f88e4a7ad2f
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Sami Tolvanen <samitolvanen@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>
Cc: linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jihan LIN <linjh22s@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768391298; l=1284;
 i=linjh22s@gmail.com; s=linjh22s_machine; h=from:subject:message-id;
 bh=42b1jPMRaZQMJsFTcdIPsgOH+T5OPHq2ZKwWlPwIz44=;
 b=OhZJJST3EqaB8evuw8uBs1/Mh0MwTtGN1AdtBslfMv4u2s/DuVo6soixm5q9t7N9lQDdQmtf9
 gnU8lXrczWABzmmL5EWYh3qHGm4lX5ghB3gimUgRYyMRPQM8nDZqA7C
X-Developer-Key: i=linjh22s@gmail.com; a=ed25519;
 pk=MnRQAVFy1t4tiGb8ce7ohJwrN2YFXd+dA7XmzR6GmUc=
X-Endpoint-Received: by B4 Relay for linjh22s@gmail.com/linjh22s_machine
 with auth_id=592
X-Original-From: Jihan LIN <linjh22s@gmail.com>
Reply-To: linjh22s@gmail.com

Hi,

I found there is no documentation for build dependencies in gendwarfksyms
while digging into Rust drivers. Though Yuli added libdw-dev to the build
dependencies for packaging [1], it seems that there is no documentation
about it.

This series documents the build dependencies of gendwarfksyms, adds a few
examples for installing these dependencies on some distributions and
introduces indentation style cleanup as suggested.

[1]: https://lore.kernel.org/all/79C925DCE2E963FF+20250422104927.144252-1-wangyuli@uniontech.com/

Signed-off-by: Jihan LIN <linjh22s@gmail.com>
---
Changes in v2:
- Fix style for section 'Dependencies'.
- Introduce a new patch to clean up indentation in gendwarfksyms.rst.
- Link to v1: https://lore.kernel.org/r/20260108-documents_gendwarfksyms-v1-1-52b1f9c38c70@gmail.com

---
Jihan LIN (2):
      Documentation/kbuild: Document gendwarfksyms build dependencies
      Documentation/kbuild: gendwarfksyms: Style cleanup

 Documentation/kbuild/gendwarfksyms.rst | 123 +++++++++++++++++++--------------
 1 file changed, 73 insertions(+), 50 deletions(-)
---
base-commit: b71e635feefc852405b14620a7fc58c4c80c0f73
change-id: 20260105-documents_gendwarfksyms-9f88e4a7ad2f

Best regards,
-- 
Jihan LIN <linjh22s@gmail.com>




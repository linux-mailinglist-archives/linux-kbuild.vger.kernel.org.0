Return-Path: <linux-kbuild+bounces-148-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C489C7F6713
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Nov 2023 20:26:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8038C281C04
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Nov 2023 19:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B0F74120D;
	Thu, 23 Nov 2023 19:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423C93E48C
	for <linux-kbuild@vger.kernel.org>; Thu, 23 Nov 2023 19:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8253CC433C9;
	Thu, 23 Nov 2023 19:26:19 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH] arm64: add dependency between vmlinuz.efi and Image
Date: Thu, 23 Nov 2023 19:26:17 +0000
Message-Id: <170076756599.3159824.14293812187454563745.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231119053234.2367621-1-masahiroy@kernel.org>
References: <20231119053234.2367621-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 19 Nov 2023 14:32:34 +0900, Masahiro Yamada wrote:
> A common issue in Makefile is a race in parallel building.
> 
> You need to be careful to prevent multiple threads from writing to the
> same file simultaneously.
> 
> Commit 3939f3345050 ("ARM: 8418/1: add boot image dependencies to not
> generate invalid images") addressed such a bad scenario.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: add dependency between vmlinuz.efi and Image
      https://git.kernel.org/arm64/c/c0a857420405

-- 
Catalin



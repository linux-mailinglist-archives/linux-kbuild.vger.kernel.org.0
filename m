Return-Path: <linux-kbuild+bounces-5824-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD9AA3A015
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2025 15:38:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 407E8163DC7
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2025 14:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2315269B03;
	Tue, 18 Feb 2025 14:33:56 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9616C2417C5;
	Tue, 18 Feb 2025 14:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739889236; cv=none; b=GZOj18kFecCVut+/5Fgtu3rqDCD/n36UG3y69p5P931rIZ+JmVKBjCp8mPMWi1YSq2OmvPudPsnACeOnbyULtCUb48mGKkPT60o7/JkAFOs1h6J7ySZQvofmO4i9xZMTMjF/H7Fw9DbHGomnv36SvAe3hbzQgA1/5YZvHi+Qwxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739889236; c=relaxed/simple;
	bh=dD1EK1xrVXA5cExlcxN9TkVo2ZSIeE4Wg+CYc+EEd7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FrjSnClzu4pzW8gA+fB/n4BtDlSZUqtvPo4+aV9UW951KLvzo8r5Fo3t/UxNPR3u1Nvx8u3bAIoKnVOG7Q+UCAQmx2s80PioMcQQzFho7Dajx5i1tVJ+6perxiUCY0tLYA7Fa+AUjgrR0789SfSVWjpyHzh/PF97kxQ+JoMVKiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1064EC4CEE2;
	Tue, 18 Feb 2025 14:33:53 +0000 (UTC)
Date: Tue, 18 Feb 2025 09:34:14 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Uday Shankar <ushankar@purestorage.com>, Frederic Weisbecker
 <fweisbec@gmail.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 1/2] scripts: make python shebangs specific about
 desired version
Message-ID: <20250218093414.68069ce1@gandalf.local.home>
In-Reply-To: <20250210-debuginfo-v1-1-368feb58292a@purestorage.com>
References: <20250210-debuginfo-v1-0-368feb58292a@purestorage.com>
	<20250210-debuginfo-v1-1-368feb58292a@purestorage.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 10 Feb 2025 18:11:54 -0700
Uday Shankar <ushankar@purestorage.com> wrote:

> diff --git a/scripts/tracing/draw_functrace.py b/scripts/tracing/draw_functrace.py
> index 42fa8730094166b5883aaa92b0e2c32e0268b120..97594b65f8ce9b1ade7f08b6b95eee6a1383fec7 100755
> --- a/scripts/tracing/draw_functrace.py
> +++ b/scripts/tracing/draw_functrace.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/env python
> +#!/usr/bin/env python3
>  # SPDX-License-Identifier: GPL-2.0-only

Does anyone actually use this script?

If not, I wonder if we should just remove it.

Frederic?

-- Steve


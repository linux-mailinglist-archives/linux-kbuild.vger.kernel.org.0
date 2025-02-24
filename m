Return-Path: <linux-kbuild+bounces-5891-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 646CCA42FC2
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 23:06:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7E513A7BF0
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 22:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD6B1DE3AD;
	Mon, 24 Feb 2025 22:06:35 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED081C8637;
	Mon, 24 Feb 2025 22:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740434795; cv=none; b=D+PdgM945lFEDeuPHa4H4jXRnnAev7XPraIkQ0ywunzyk+mC4E2jCNYGhBr39MFwBXa+ahpG9P/IynPn+LJYVN0gJdD6M8D/C6YpYweehhZsBMIudUbVJTATGujSYWHw6vA4Wo5zzN2ZhavhWuFw1KjV74dUnhsTBQwtZ6Fmow8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740434795; c=relaxed/simple;
	bh=oCCJfpLZfX4eQEAPAVAITLOdVQJL4JECTyQgjpR9tVw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vf+38f6Bgi7mvG+X25rW1+hqPR9VkJWddReLq0j5yRTSc0tTaqJCBcDI6FCu9sPSYtkIg3ceMpAR21jkXQ4obWEY/xvQY7tN9zWch8vMjuH0BdaxUReUAQBzvfxP5x6p7fAlvTsz9cmEqcaRfk7TuOMOb14gIjGBvZIQAgwOw88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD31DC4CED6;
	Mon, 24 Feb 2025 22:06:33 +0000 (UTC)
Date: Mon, 24 Feb 2025 17:07:09 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Uday Shankar <ushankar@purestorage.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 0/2] kbuild: rpm-pkg: improve debuggability
Message-ID: <20250224170709.3eb9d94c@gandalf.local.home>
In-Reply-To: <Z7zJ5EjIFLbz9C3I@dev-ushankar.dev.purestorage.com>
References: <20250210-debuginfo-v1-0-368feb58292a@purestorage.com>
	<Z7Pv+hD3AOS/ymFI@dev-ushankar.dev.purestorage.com>
	<Z7zJ5EjIFLbz9C3I@dev-ushankar.dev.purestorage.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 24 Feb 2025 12:35:00 -0700
Uday Shankar <ushankar@purestorage.com> wrote:

> On Mon, Feb 17, 2025 at 07:27:06PM -0700, Uday Shankar wrote:
> > ping  
> 
> ping again

Do you just package it, or do you actually use it?

-- Steve


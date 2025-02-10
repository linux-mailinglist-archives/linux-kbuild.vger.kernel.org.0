Return-Path: <linux-kbuild+bounces-5695-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AB6A2F1DE
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Feb 2025 16:37:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E734C3A4F1D
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Feb 2025 15:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EC1B23E226;
	Mon, 10 Feb 2025 15:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S5JBMcp1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657A223E224;
	Mon, 10 Feb 2025 15:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739201801; cv=none; b=UUHfYcQL/pp4tkRUoC4T5WOqHC1pFSa6gsT7HUoyQTuHc6SQd1f0M3w3tVSZu5r4orLyq0v901l9W4O83Eg0cfxRxGao7uj0un5ZwHYZ46TxIlMWP7oSm5P5gVVGsIoGQt9/vvASnyqtoAHAj4wIGYy0m0kXC3kS+3cLUlRGn3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739201801; c=relaxed/simple;
	bh=LDu8/7xSoMiChUQJXRsucp39IYUFFUemD0/F+BNQrt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/S4m8ef7thQqYZKDjJ7LN9rXXrKtm8hnCRL0qTi4aucU5M9/pMM6cALYHvFIQlLHgPHm1z0ytt82YPaW1zk+YWr8GAB9sexwoIf12r+re4oK4/PqGTlarlDYYVT0rCMJg9kh0t21SnZFQNFaT1ALOWqVlKrxRSHeEEnYaMHQw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S5JBMcp1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FA23C4CED1;
	Mon, 10 Feb 2025 15:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739201800;
	bh=LDu8/7xSoMiChUQJXRsucp39IYUFFUemD0/F+BNQrt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S5JBMcp1d7uE8gz3FdsSmxPjpcHFaivdOWUD8N1WmigmSLDmxgj6n3EP8uOdFj+9q
	 N559Sg6fIHXWCWfLbqpqYAPEgzpV5mU9ZSxF08Z+/o7I8FmzWQkuOpaCxDav2wyS5a
	 zlXnWWxpIanOmoB+V8iIjGse6laOQ3EEFxnE9F4WjZ5Y3NdHxky3G8WkxaDcvitSAO
	 zh+nS4t3t+tU958Z+dMsinPIlniEImq3sMGIP0Prdlfhv2J7wSEfORI3fFPM3nPkMR
	 JfO65PX8evOt3/5NohBuiNvdYfTmAPjwa7vWocRsO9svH00m7hRKfEq9p2nQKpDvtr
	 pAwW5OifT++Zw==
Date: Mon, 10 Feb 2025 07:36:39 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Ole Schuerks <ole0811sch@gmail.com>
Cc: linux-kbuild@vger.kernel.org, jude.gyimah@rub.de,
	thorsten.berger@rub.de, deltaone@debian.org, jan.sollmann@rub.de,
	masahiroy@kernel.org, linux-kernel@vger.kernel.org,
	nathan@kernel.org, nicolas@fjasle.eu
Subject: Re: [PATCH v7 03/11] kbuild: Add list_count_nodes and
 list_for_each_entry_from
Message-ID: <Z6odBxaAI47FTiWI@bombadil.infradead.org>
References: <20250208163959.3973163-1-ole0811sch@gmail.com>
 <20250208163959.3973163-4-ole0811sch@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250208163959.3973163-4-ole0811sch@gmail.com>

On Sat, Feb 08, 2025 at 05:39:51PM +0100, Ole Schuerks wrote:
> list_count_nodes and list_for_each_entry_from exist in
> include/linux/list.h. Add them to scripts/include/list.h.
> 
> Signed-off-by: Ole Schuerks <ole0811sch@gmail.com>

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis


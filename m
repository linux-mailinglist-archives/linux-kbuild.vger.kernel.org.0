Return-Path: <linux-kbuild+bounces-2775-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB62944D53
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Aug 2024 15:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AD0A289190
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Aug 2024 13:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B3D81A3BB8;
	Thu,  1 Aug 2024 13:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EBE4tdKp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2321A38D1;
	Thu,  1 Aug 2024 13:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722519691; cv=none; b=M7yeaFI1p55ca8JlC3LfakW3b7v3Q9mtY6ze6/kUkKjFgsWk0FGMwin/Cm8ZQ/wnX3wqF4QZntgpWB7s2N5gapJEID+xCdX0QBSgijYfYxHGa8jPQ2EC2S+FeANRUNQAiYf9cCmdey6hB88pNeUXPRKdZT9kz0a4jS2M8HDXOtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722519691; c=relaxed/simple;
	bh=uYY8zDsyz82/IltzUwmXwBdiv13AL9CcrOTjQuiM3eE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4h+7qLpz0O06fUr8M5Nx6SClXybeT9agMOpCzLHu4KofCjU5bp22kEq91k645ubaPJVSMPOsogApqAUqXhlI1vHq0umElUntJpIB22Uu7v05GTsV+wPRlqhO4shsgpMiXBkrTzkm3ngEZBF3WhBK0wqAihDR45oG3DCjxiAH7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=EBE4tdKp; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SX310Kfz9F1LeUqNyAu30/YcWRhCZpZMe1PAqRFcLtQ=; b=EBE4tdKp6jD8SukAL4JzcFiWV/
	xcRSpCePbRWeE8VOlxdil0P30skt+D5IE8iSPjvd41RXYaAjQqOWOsqfatymR6wpnE/E5/FuGM22L
	q3sMMPbzx+ebd2//UEpH0Je7UwtcPnxBsqatfF3moqQY506o+537fIeQ1gUO9q57CKLi8qwywvxT6
	13rxzNCoq4MFN+nSDbycht2EbxSkEzbJ4S1rCtZmxjYtfd/gkTC4R/RHZdAEqHd+htHiDj5yPRQRi
	fXdDFzfE2bng/9DYG9Z4Z8wfq3LAtzIw0SJLhg23Yg4GgPfLO/GiqTXeMiyfYMiec8VeL1DFmuJqY
	WC+V6ESQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZW3U-00000005TiG-1Qna;
	Thu, 01 Aug 2024 13:41:20 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7B73130074E; Thu,  1 Aug 2024 15:41:19 +0200 (CEST)
Date: Thu, 1 Aug 2024 15:41:19 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Matthew Maurer <mmaurer@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Rust KCFI support
Message-ID: <20240801134119.GB39708@noisy.programming.kicks-ass.net>
References: <20240801-kcfi-v2-0-c93caed3d121@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801-kcfi-v2-0-c93caed3d121@google.com>

On Thu, Aug 01, 2024 at 01:35:16PM +0000, Alice Ryhl wrote:

> Alice Ryhl (1):
>       cfi: add CONFIG_CFI_ICALL_NORMALIZE_INTEGERS
> 
> Matthew Maurer (1):
>       rust: cfi: add support for CFI_CLANG with Rust

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>


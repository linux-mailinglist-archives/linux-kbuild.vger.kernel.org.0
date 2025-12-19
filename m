Return-Path: <linux-kbuild+bounces-10276-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB661CD1F10
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 22:15:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7EAE8305D654
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 21:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B4452C11F1;
	Fri, 19 Dec 2025 21:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rbH04Wfy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6C2246768;
	Fri, 19 Dec 2025 21:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766178924; cv=none; b=bXN2Dndt2pCmkjy36I/pp9YYjnAovVT+aK6VAWNguFlLsqgtE3+kxsV5Pw8fEaMy0JP2Ii4lHpNnXlku8tAVHHJ6UBRN5o+GsRRforlQhEqUA95r14lv5vjcqxYMyor5teObz8Nrbvq5kCK+/hO83UW4sxHkE3qrMXpaU42r/Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766178924; c=relaxed/simple;
	bh=WNOY3xdxekizquK/z0hsQNMesHdiHY05ehb8h2e4E5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Llru0URvhMypRfl244VFZOObZSoP4bLmI9tcqk9V1CvNR5LVkhBdi7cg29Amdq2FG21k6osrPdOZ3TBJ5I3fNHEzVIRPggmLX6dVHzQycqPLuszkCiUgVchD8aNE3v8zNkE6jPAMafqSYuRoM9/+JufB0LUtl16sDbArfb6F5eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rbH04Wfy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A4F5C4CEF1;
	Fri, 19 Dec 2025 21:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766178923;
	bh=WNOY3xdxekizquK/z0hsQNMesHdiHY05ehb8h2e4E5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rbH04WfyOLEiryV2Po84Y8mhu9sB+RKvEKqoDBrI1pUxLG+rZlcZu4PfWMBcGURzU
	 Y08zXI7cghnYiaIa+I+h5ogvux3gGtlRy1TxL8NxS+vT8ut2UiNcXQez9Q1qKld0OV
	 MLi/DjJNb9H9I8DX0dWXpgI3Y93VBHyLETMA4iR9EsHw4z/iaee5s3Wd8Hs3FIu38z
	 WnzpoIrujaQIhSSkR8gqnD0wqgm4Tvorc03LWhh+alQt+0O9FQ141QIAtDNIdHgYbA
	 fCXCyPFy+z/LyLGwzYZsXp78hNnHMqptjCeFEP6DDSOAiCrfTGJmA+AoBZAEKzj9Aq
	 HvhmDmBW/ctQg==
Date: Fri, 19 Dec 2025 14:15:18 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Miguel Ojeda <ojeda@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
	llvm@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v1 1/2] scripts: add tool to run containerized builds
Message-ID: <20251219211518.GB1407372@ax162>
References: <cover.1765374789.git.gtucker@gtucker.io>
 <97dec58ebe4161027f13f2215ed9da4a43bc8c47.1765374789.git.gtucker@gtucker.io>
 <20251219194748.GA1404325@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219194748.GA1404325@ax162>

On Fri, Dec 19, 2025 at 12:47:48PM -0700, Nathan Chancellor wrote:
> Most of these two functions are the same. Maybe they could be abstracted
> into a simple class so that most of the logic could be shared between
> the two implementations? That also might simplify main() a bit and make
> fulfilling David's request a little simpler as well.

Sigh, this is what I get for working through my inbox bottom up since I
see that you did this in v2 :) looks good, I will give a couple more
comments there.


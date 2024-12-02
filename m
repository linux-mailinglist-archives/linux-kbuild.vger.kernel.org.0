Return-Path: <linux-kbuild+bounces-4941-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A9F9E0A2D
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 18:37:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D7D12828A9
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 17:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81241DDC23;
	Mon,  2 Dec 2024 17:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A6AAG4GU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F091DDC25;
	Mon,  2 Dec 2024 17:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733160997; cv=none; b=RO/RDXl3N/I4QKfkzXOiajYWyoOevzaQxNA8inAQBMImqKiU9tM1l8OsW8iYowgRiklCgkdC3fqUk/iiczo4g/NRhtRxAwps236H0MnNrFDpioItRoO/MYr/1zkHaFBhk5rxrokLLKMtRKR0NDg2bdRvDLsXZPPjUr5DzCW9Y8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733160997; c=relaxed/simple;
	bh=zHI4obpWdbu09MOJBanUKMpjJiwHqJ8gWb3psfdQkCE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=V0i5M0mQBYWUCb6F5LJj/ilA9l1l9kD5vnhxJ9FiVM+2jjYP0vwwZ3BQytZg+QNIvbtx+/Mc/VadPqer2exjdSgUay8kgWOFmeumkerQ9pPqw+YnVX+Bl59XQIyAB+nKff/HsdJN/PTfSDUKbergdF52PkqwUbG+4FKC7YE4zVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A6AAG4GU; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733160996; x=1764696996;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=zHI4obpWdbu09MOJBanUKMpjJiwHqJ8gWb3psfdQkCE=;
  b=A6AAG4GUoW1huZywYaC0seJtpkW0pI9TWP7BQdBQibZiB9m+Qh68Vws1
   o3KosR6O8PGMiTFsjGv4ZaKZtR4QO1R1NBHYaGYS53KQLoH7tjQYQXkNJ
   DHO9sKHDCIAM3CBx/+u+3TdN5KyWvhRnJFMIJcN4zzjtkLIVN8FQ/8RHN
   y6/GfUQ0dYh+t0SBLZorF6Y6dgQ8E1oNTOel6xJ2US3kFQToalEuLKzS+
   F1rEkTrQVFSgMAw6jq1i+OlO+PklG6NVFsfmOWYp3RqXFDR0b/OOitm73
   YRPAKx4G3Ddmsr11rd/02FbKaziKl/xtO1BiwHj52pQMVw9RZtqUBnpQV
   A==;
X-CSE-ConnectionGUID: wMWf0tplSSiwp2KmZ3+9ng==
X-CSE-MsgGUID: h5DlZ5JPShKZZ5pLV3GGrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="58746407"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="58746407"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 09:36:35 -0800
X-CSE-ConnectionGUID: xyK3a6dhRcasZFQgn3I+lw==
X-CSE-MsgGUID: Rdwxi7MMRJuME0JfD1ktRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="116439327"
Received: from tassilo.jf.intel.com (HELO tassilo.localdomain) ([10.54.38.190])
  by fmviesa002.fm.intel.com with ESMTP; 02 Dec 2024 09:36:35 -0800
Received: by tassilo.localdomain (Postfix, from userid 1000)
	id 18D17301AA5; Mon, 02 Dec 2024 09:36:35 -0800 (PST)
From: Andi Kleen <ak@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mcgrof@kernel.org,  x86@kernel.org,  hpa@zytor.com,
  petr.pavlu@suse.com,  samitolvanen@google.com,  da.gomez@samsung.com,
  masahiroy@kernel.org,  nathan@kernel.org,  nicolas@fjasle.eu,
  linux-kernel@vger.kernel.org,  linux-modules@vger.kernel.org,
  linux-kbuild@vger.kernel.org,  hch@infradead.org,
  gregkh@linuxfoundation.org
Subject: Re: [PATCH -v2 0/7] module: Strict per-modname namespaces
In-Reply-To: <20241202145946.108093528@infradead.org> (Peter Zijlstra's
	message of "Mon, 02 Dec 2024 15:59:46 +0100")
References: <20241202145946.108093528@infradead.org>
Date: Mon, 02 Dec 2024 09:36:35 -0800
Message-ID: <878qsy7zrw.fsf@linux.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Peter Zijlstra <peterz@infradead.org> writes:

> Hi!
>
> Implement a means for exports to be available only to an explicit list of named
> modules. By explicitly limiting the usage of certain exports, the abuse
> potential/risk is greatly reduced.

Blast from the past: https://lists.linuxcoding.com/kernel/2007-q4/msg19926.html

Yes it makes sense.

-Andi


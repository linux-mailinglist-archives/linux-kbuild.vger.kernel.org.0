Return-Path: <linux-kbuild+bounces-10452-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E58DBD0C248
	for <lists+linux-kbuild@lfdr.de>; Fri, 09 Jan 2026 21:11:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DB5CE30089A9
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Jan 2026 20:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2CF261B6D;
	Fri,  9 Jan 2026 20:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m5rIwwPw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9216B1A58D
	for <linux-kbuild@vger.kernel.org>; Fri,  9 Jan 2026 20:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767989481; cv=none; b=td+VrohFBe3Qo0do8PIoCby0IYgE0LsTDMx2jgO8uvVcsSQ7Fj+7DO00KJbxmWMOHPP0Z7rOkfVBUuoWrPeimrwkyfNsxhvPuKJ62SKXKYV+LClyaj5tgQZDuto1L+e56UmBt1Z2ZK+2e7/fXzauhtlqE6JO3uVPH9lxeBQsu+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767989481; c=relaxed/simple;
	bh=z7KFs8b/ygfjXm2E7ggomeHnfjvcMi1E2zfXgRfwWgQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=jlBRsLzC+XRRAW/7usuYh7pJ6kAcZfP4tRGIXdWuIywT2XSWvOOcM/R+QUndlqB6lZr51x0YiFVhbeSM+QqETyENaQOVmQ0tZFRKKb4gxNBN/gQdeHuC1DlCyYJYcmGC7sYEQnNgJz571pQFD/NyutBO7XmSl7CTpyBeCMq9PxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m5rIwwPw; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767989480; x=1799525480;
  h=message-id:date:mime-version:to:cc:from:subject:
   content-transfer-encoding;
  bh=z7KFs8b/ygfjXm2E7ggomeHnfjvcMi1E2zfXgRfwWgQ=;
  b=m5rIwwPwLAyKIxA3mjptWkPCX7e7tDLva4fCs2s2SSrzozgcUFAJHdzs
   7dbu9M0unWdJtw+1yQXujopdYIFsSjetXrT2GjpTx/tJNDr5oj/sE3Rgx
   nPRvLU+qSui+VdXDs2KG0KgB4K1bbZJ3DWmHBdIwXa+19TrrGP85H2okk
   nrAm+c3eoPpDl4vqmM2MGq0uczDtntH8go6V4kwAZwSQ71Sa/BqBU74G5
   B604c0lDosQtZWycTd/l5AhS+CWzZ2MY+a46pH3UBhZ90D1uvtur2NL7n
   uDOANnVc6Y+z6mpHWW6qsW6350Xl5h92fbjwuNwXwHdFWkbilYQ+lFhzv
   A==;
X-CSE-ConnectionGUID: zStsv+QKTnurMxkfdOYx9Q==
X-CSE-MsgGUID: qf7oIPlZS9mprqN+YLynAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69445954"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="69445954"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 12:11:20 -0800
X-CSE-ConnectionGUID: wCcufjoTRd6/iOX/37icgA==
X-CSE-MsgGUID: tdIeFptWTRe0eYsS4lcNvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="234755013"
Received: from cjbeckma-mobl1.amr.corp.intel.com (HELO [10.246.21.211]) ([10.246.21.211])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 12:11:19 -0800
Message-ID: <675fb923-ea81-4109-b828-24caf89fa795@linux.intel.com>
Date: Fri, 9 Jan 2026 21:11:16 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-kbuild@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, masahiroy@kernel.org
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Subject: Module out of tree compilation fails due to missing kdoc python
 module after 992a9df41ad7
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

I have run into an issue after recent commit 992a9df41ad7 ("docs: bring
some order to our Python module hierarchy").

When building out-of-tree module with W=1 flag (using headers .deb
package built with bindeb-pkg target), kernel-doc.py now tries to:

import from the kdoc
from kdoc.kdoc_files import KernelFiles
from kdoc.kdoc_output import RestFormat, ManFormat

PYTHONPATH for kernel-doc.py is set relative to the file itself, which
in case of using headers is just ../tools/lib/python but it does not exist.

So the tools/lib/python/kdoc module isn't included in the
headers .deb package created by bindeb-pkg target (it only contains
objtool under tools/) which causes failures during the build due to
missing kdoc module.

Should these Python modules be packaged with kernel-doc.py in the
headers .deb package or am I missing something here?

Thanks,
Karol


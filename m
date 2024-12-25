Return-Path: <linux-kbuild+bounces-5239-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C324E9FC5E5
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Dec 2024 16:34:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD1AE163671
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Dec 2024 15:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85DC275809;
	Wed, 25 Dec 2024 15:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p7IZboEw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584532E859;
	Wed, 25 Dec 2024 15:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735140842; cv=none; b=lrjReFGoYMO7iPRepl72ZdWSkOVI4CQUdOJriJgr+1UFSfHAnXHajB6MRtI9KJWlR0brCC7hUInQOUc746t0uZiVg6pofbPEqxYiN8K95RC4lYktJopnsD4FBafnVeTxrn3DMyLmXN3h/Yv1kmcV20i0zjHoIdVzSVLU3ORI3hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735140842; c=relaxed/simple;
	bh=Ao36kfaICvtlGMKfD3v9McRrnvkZ7RA45IErO0CVbXg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fQ3se7maiXq387tkHjWKwXEY5c3P/akIZM9zO5RAHeaXGPLFlsv07vsmxVKSoN8bEz1lr0rmXtcypFpxQ9tNL9sz1oV/EPPEzGTYzkgLl+QHu82CF+X8y6Rp+avvYtqWdeodw8pFowkCmsE8CxrVx2THg0cw+c0SkRWT+bMOyEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p7IZboEw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA09C4CECD;
	Wed, 25 Dec 2024 15:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735140841;
	bh=Ao36kfaICvtlGMKfD3v9McRrnvkZ7RA45IErO0CVbXg=;
	h=From:To:Cc:Subject:Date:From;
	b=p7IZboEwypNCawtsbtf6nA2Ygh7JbZtFcbH3krBIUqOF4PaDLWBQvBnPs0RnQ9NQB
	 V06Bn6+yz8G5AXaTKve2HlErDQzeUaenn5o73pkhN0PwNYNqcDvMGHVm4tp7trO9Cf
	 xU79mrWwS0pkiV5TKCjzrR8H+tnSmWjE3mpwy+ac9c2BDrI786n7plgzN7ZDwiRtXx
	 us5Agwn5WwGCn95M2Nkt6C5jOF0fxnt9xczJZlyO5CMhAa8GjDpxlZarJxDZcM96na
	 PywwD4TaaTaCpTPuydmX4pM5a2UN6dQykDokAVyN02PtIhM4TGSzj7f6zauXorKELD
	 aQ6uJlzxXdL8A==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Greg Kroah-Hartman <gregkh@suse.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Rusty Russell <rusty@rustcorp.com.au>
Subject: [PATCH 0/3] modpost: work around unaligned data access
Date: Thu, 26 Dec 2024 00:33:34 +0900
Message-ID: <20241225153343.134590-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The latest binutils stopped aligning section data in relocatable ELF.
It saves small number of bytes that were previously inserted between
sections. However, modpost crashes due to unaligned access:
  https://sourceware.org/bugzilla/show_bug.cgi?id=32435
  https://sourceware.org/bugzilla/show_bug.cgi?id=32493

Similar to kernel space, unaligned data access in userspace can be
problematic on some architectures.

Simple example on ARM:

 $ CC=arm-linux-gnueabihf-gcc
 $ echo 'int foo(int *p) { return *p + *(p + 1); }' | ${CC} -O2 -x c - -c -o foo.o
 $ echo 'int foo(int *p); int main(void) { char str[16] = "helloworld"; return foo((int *)(str + 1)); }' | ${CC} -x c - -c -o main.o
 $ ${CC} -static -o unalign-test main.o foo.o
 $ qemu-armhf unalign-test
 qemu: uncaught target signal 7 (Bus error) - core dumped
 Bus error (core dumped)

In this case, the 'ldrd' instruction causes a bus error due to an
unaligned access. If the -O2 flag is omitted, this issue does not occur.

To avoid potential unaligned access, use the get_unaligned() approach
as seen in the kernel space.



Masahiro Yamada (3):
  modpost: fix the missed iteration for the max bit in do_input()
  modpost: refactor do_vmbus_entry()
  modpost: work around unaligned data access error

 scripts/mod/file2alias.c | 36 +++++++++++++++++-------------------
 scripts/mod/modpost.c    | 24 ++++++++++++------------
 scripts/mod/modpost.h    | 14 ++++++++++++++
 3 files changed, 43 insertions(+), 31 deletions(-)

-- 
2.43.0



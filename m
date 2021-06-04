Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD19839BC02
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Jun 2021 17:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231163AbhFDPiT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 4 Jun 2021 11:38:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:36444 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230508AbhFDPiT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 4 Jun 2021 11:38:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A59061400;
        Fri,  4 Jun 2021 15:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622820993;
        bh=h5YsqU5msETH1MjX4Ecj6RuxMXmL0jinT2QLbtaP5Ek=;
        h=From:To:Cc:Subject:Date:From;
        b=R4Qc2+fyT6JsK7val+J7fxeXjOaAEzRWDWf19j7FTWJ6ed61revDQXd37dNUvkcbi
         M+X/LlFU5lmno8yJ+aaHw0IDI8lO2r6cO5xoJ3TcDOqucn7FjU5H4iXVXXYquKcmMz
         rebMJlTWRK7+dm1HGnW3I8qhV0XIIqTju8XWo86IXC+Y+RxUZC/4y7uryLAXfHY6vq
         SXRglf9bZ0/OR5TOwlVWr0hpgRCu/v7U3M0wntES526vkbwHc6ZW1py3FqXqufIU7X
         I1//j4EO+jxcrihFo850cih1l3SFukzeFaPLbCOAeJGH+QkJob+fBbN5eFWewUKIkh
         47ZazqxxlGHpQ==
From:   Mark Brown <broonie@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>
Subject: [PATCH] kbuild: modpost: Explicitly warn about unprototyped symbols
Date:   Fri,  4 Jun 2021 16:36:11 +0100
Message-Id: <20210604153611.52209-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365; h=from:subject; bh=h5YsqU5msETH1MjX4Ecj6RuxMXmL0jinT2QLbtaP5Ek=; b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBgukhokjS0QmFM54TzUVRqP9Y8kBHyt8PtBDdF2fjN rKnQ8BCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYLpIaAAKCRAk1otyXVSH0JuFB/ 9jaq778WxU7dBoNxAfkJxIf/wvIis5DDdPavyn214YbBsQvbW3BTNM83L9vcFC7zOo0rP6krVYmTd+ tt1BO/XsXFsyDDrDPpVBHdrv9B+PM+iQfFP+DxR5obEfB36cw5FJj3Y/VcBjL8v++u3Eb0GWHKqv1F LxiIGh1WfPcG7GAdAZlEXWUzXxW5qTEuPTymHuJUmr+3gL9niaeoG3v8Y0U7Vx8Z98sa+9KNvlMtXs skP1usaNuJ828UEdC5nv/FyqqCzdAq7Nfa4APY93J5xlVewMqfoo/sz53ZXZS0we6USSrO64WGUIKe 2j26xGHayvsHSczvYn9ssnt2L/5T8u
X-Developer-Key: i=broonie@kernel.org; a=openpgp; fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

One common cause of modpost version generation failures is is a failure to
prototype exported assembly functions - the tooling requires this for
exported functions even if they are not and should not be called from C
code in order to do the version mangling for symbols. Unfortunately the
error message is currently rather abstruse, simply saying that "version
generation failed" and even diving into the code doesn't directly show
what's going on since there's several steps between the problem and it
being observed.

Provide an explicit hint as to the likely cause of a version generation
failure to help anyone who runs into this in future more readily diagnose
and fix the problem.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 scripts/mod/modpost.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 3e623ccc020b..78553f95c250 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -662,6 +662,8 @@ static void handle_modversion(const struct module *mod,
 	if (sym->st_shndx == SHN_UNDEF) {
 		warn("EXPORT symbol \"%s\" [%s%s] version generation failed, symbol will not be versioned.\n",
 		     symname, mod->name, mod->is_vmlinux ? "" : ".ko");
+		warn("Is \"%s\" prototyped in asm/asm-prototypes.h?\n",
+		     symname);
 		return;
 	}
 
-- 
2.20.1


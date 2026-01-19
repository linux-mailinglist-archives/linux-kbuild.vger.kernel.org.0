Return-Path: <linux-kbuild+bounces-10683-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE34D3A7CF
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 13:05:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2556A300C98F
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 12:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A16359FA1;
	Mon, 19 Jan 2026 12:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RzyRKDQB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2E735970D;
	Mon, 19 Jan 2026 12:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768824317; cv=none; b=QZr6I3i2WhiVuW4OW7ndBWPW+ME0KYh652xnYP7kdYo3xVGOLwVm9kn8SsTbFm8IV1Y3CNaHJnuGSrdtc7DLT7qEe2xdZYCiXx1RhLZWzgh1CiUtBFaJ/D0TVsQX2TPF/L9MAesXGh9LyvSH5by0L4MRYm+BkiZDpYq336/m3lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768824317; c=relaxed/simple;
	bh=gswQgvIkCvCKkiNyrJA/gedBlbjViDDQyImQR0Lwtf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dyFng7SQmvYASmdTWbaThdRnAaA9V7fNezIUnFS+HaSzzqEVy8lg9EcnzVTs6CQGOpNtALKa04sNntTM0iwqavFhuv1aATP7G1fWrE2m+CFil9Ja2YsWbmHmM4mgA+dPbdqGO+QUv1ZEtxe/Fi6sev7pGl+xzFSAhWWIhdZ8Mhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RzyRKDQB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC637C19424;
	Mon, 19 Jan 2026 12:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768824316;
	bh=gswQgvIkCvCKkiNyrJA/gedBlbjViDDQyImQR0Lwtf4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RzyRKDQBKZ8Jd5mO530fmCqsSgPVKGTrzQlo0SAFbAu3XO+BVGDp0v53+SCfKNdCt
	 CCpLlB5i4uwnLACxND1kGaKiPd/6DrKPu8UGfBPubqVllKHQxg+e4wrnmpMrW6WXIp
	 BU4Kdnkhjw+Vg1BYLQ5ZAWOGhQDeCjdz2eB+VDrSLYp2q+1yLXbS3YaSDCtREmOQx3
	 PeqUYx5SKCo+jGk5JoSxWH17jq6ujjtyvvzmssbAiYLhchZNIwdQaPmwOkFutOxae/
	 99142H+xXfrRjd+vzmaxQvZSTzk3wR5uNv0YK7s2D3AKZJ75i+0v6Irh3qLVOQ2CWF
	 StaZatb/RdONw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vho0Q-00000001ZjE-3Jmu;
	Mon, 19 Jan 2026 13:05:14 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 2/9] docs: kdoc: avoid error_count overflows
Date: Mon, 19 Jan 2026 13:04:57 +0100
Message-ID: <233d1674db99ed8feb405a2f781de350f0fba0ac.1768823489.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768823489.git.mchehab+huawei@kernel.org>
References: <cover.1768823489.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The glibc library limits the return code to 8 bits. We need to
stick to this limit when using sys.exit(error_count).

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: stable@vger.kernel.org
---
 scripts/kernel-doc.py | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/scripts/kernel-doc.py b/scripts/kernel-doc.py
index 7a1eaf986bcd..1ebb16b9bb08 100755
--- a/scripts/kernel-doc.py
+++ b/scripts/kernel-doc.py
@@ -116,6 +116,8 @@ SRC_DIR = os.path.dirname(os.path.realpath(__file__))
 
 sys.path.insert(0, os.path.join(SRC_DIR, LIB_DIR))
 
+WERROR_RETURN_CODE = 3
+
 DESC = """
 Read C language source or header FILEs, extract embedded documentation comments,
 and print formatted documentation to standard output.
@@ -176,7 +178,21 @@ class MsgFormatter(logging.Formatter):
         return logging.Formatter.format(self, record)
 
 def main():
-    """Main program"""
+    """
+    Main program.
+
+    By default, the return value is:
+
+    - 0: success or Python version is not compatible with
+      kernel-doc.  If -Werror is not used, it will also
+      return 0 if there are issues at kernel-doc markups;
+
+    - 1: an abnormal condition happened;
+
+    - 2: argparse issued an error;
+
+    - 3: -Werror is used, and one or more unfiltered parse warnings happened.
+    """
 
     parser = argparse.ArgumentParser(formatter_class=argparse.RawTextHelpFormatter,
                                      description=DESC)
@@ -323,16 +339,12 @@ def main():
 
     if args.werror:
         print("%s warnings as errors" % error_count)    # pylint: disable=C0209
-        sys.exit(error_count)
+        sys.exit(WERROR_RETURN_CODE)
 
     if args.verbose:
         print("%s errors" % error_count)                # pylint: disable=C0209
 
-    if args.none:
-        sys.exit(0)
-
-    sys.exit(error_count)
-
+    sys.exit(0)
 
 # Call main method
 if __name__ == "__main__":
-- 
2.52.0



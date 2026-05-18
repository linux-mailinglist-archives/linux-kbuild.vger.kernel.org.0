Return-Path: <linux-kbuild+bounces-13238-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCkkOBKwCmog5wQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13238-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 08:22:10 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FBD5669F6
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 08:22:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EBAFF301AB8C
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 06:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41FE3DA7C2;
	Mon, 18 May 2026 06:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="GmNu3DJk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw02.zimbra-vnc.de (mailgw02.zimbra-vnc.de [148.251.102.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064583DD85B;
	Mon, 18 May 2026 06:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.102.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779085294; cv=none; b=MQsG2aKbA9Ib3b99YeACkBn6+UNMKb/C60RCUTl/k6i4e9EtPLRBjfjXLQ7E/C8Yz1to+KePAHYfH95X+32aHQ99bEnrb4K0xxUsNXOubMSIAtotTwLUu769g4Rs0jjEyuBnMZ8KwO4ydmrHSFHx2dscXpI2rbhaB1CvFwbOm+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779085294; c=relaxed/simple;
	bh=sc1qifr0NbrTLegWs/gxE4CtFE7Fs7BznzCjm3fngtk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T+E+9n9TIQfy8eaJY8wRIyiaqx59FXSFbtDVAcGEprAsD6yXpNwIxIuTOr1rEE1I7I4DUqWJOLvgdEbCeAGemYFEXapNJGZD1STp1unBBwK3jyEMgzajHdMt37NVUqnk0bkx9x9j3p+/zNczQDL09sv3Pmy9BQcyeFuxMVEXXy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=GmNu3DJk; arc=none smtp.client-ip=148.251.102.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw02.zimbra-vnc.de (Postfix) with ESMTPS id 93B16200AA;
	Mon, 18 May 2026 08:21:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 7ED391FACCB;
	Mon, 18 May 2026 08:21:23 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id hhXo_hbDYj73; Mon, 18 May 2026 08:21:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 294011F89A8;
	Mon, 18 May 2026 08:21:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 294011F89A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1779085278;
	bh=uzlFQH12ZsN3N3nLGnxAARdVacoGgTMH5VaLuq8ilmQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=GmNu3DJkrfEvA3RZkCkkD3CsMvFZJ5z1kTRm1QuFd5i4BpMlIOWlDLQrIRMo9iW21
	 3XBmJzrpaMlseKtLNZzalKCO8cf86Is97EqagJHj8JH0U7Nw7I42AMgXcJ09xV7K+x
	 dw0qqn7uJ/UIg8f85hqI+lh20BJkotEu7BxmzJDhRvG8s2kEBgl4rEe1WfPrVyyadc
	 U2qdOAtecltGeO+5m5ZkCj8DNNoCoMWYWMbc/FMFrWwxOPYh30G0O8xU6glyz0s9wK
	 6FVNa3Usfum5rxEj43I0GdmGGGAW2O6x0F3vtZV058bVEBY6vJSyu1Lkg2bPvUhYGR
	 2FeCGMuNdUrqA==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 39DvHcZ5ma1d; Mon, 18 May 2026 08:21:18 +0200 (CEST)
Received: from luis-Precision-5480.. (ipservice-092-209-239-167.092.209.pools.vodafone-ip.de [92.209.239.167])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id C86C41FAD2B;
	Mon, 18 May 2026 08:21:17 +0200 (CEST)
From: Luis <luis.augenstein@tngtech.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	kstewart@linuxfoundation.org,
	maximilian.huber@tngtech.com,
	Luis Augenstein <luis.augenstein@tngtech.com>
Subject: [PATCH v7 07/15] scripts/sbom: add SPDX classes
Date: Mon, 18 May 2026 08:20:54 +0200
Message-ID: <20260518062102.2051814-8-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518062102.2051814-1-luis.augenstein@tngtech.com>
References: <20260518062102.2051814-1-luis.augenstein@tngtech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 58FBD5669F6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[tngtech.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[tngtech.com:s=B14491C6-869D-11EB-BB6C-8DD33D883B31];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13238-lists,linux-kbuild=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[spdx.org:url,spdx.github.io:url,tngtech.com:email,tngtech.com:mid,tngtech.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[luis.augenstein@tngtech.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[tngtech.com:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

From: Luis Augenstein <luis.augenstein@tngtech.com>

Implement Python dataclasses to model the SPDX classes
required within an SPDX document. The class and property
names are consistent with the SPDX 3.0.1 specification.

Assisted-by: Cursor:claude-sonnet-4-5
Assisted-by: OpenCode:GLM-4-7
Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 scripts/sbom/sbom/spdx/__init__.py        |   7 +
 scripts/sbom/sbom/spdx/build.py           |  17 +++
 scripts/sbom/sbom/spdx/core.py            | 170 ++++++++++++++++++++++
 scripts/sbom/sbom/spdx/serialization.py   |  62 ++++++++
 scripts/sbom/sbom/spdx/simplelicensing.py |  20 +++
 scripts/sbom/sbom/spdx/software.py        |  69 +++++++++
 scripts/sbom/sbom/spdx/spdxId.py          |  36 +++++
 7 files changed, 381 insertions(+)
 create mode 100644 scripts/sbom/sbom/spdx/__init__.py
 create mode 100644 scripts/sbom/sbom/spdx/build.py
 create mode 100644 scripts/sbom/sbom/spdx/core.py
 create mode 100644 scripts/sbom/sbom/spdx/serialization.py
 create mode 100644 scripts/sbom/sbom/spdx/simplelicensing.py
 create mode 100644 scripts/sbom/sbom/spdx/software.py
 create mode 100644 scripts/sbom/sbom/spdx/spdxId.py

diff --git a/scripts/sbom/sbom/spdx/__init__.py b/scripts/sbom/sbom/spdx/=
__init__.py
new file mode 100644
index 00000000000..4097b59f8f1
--- /dev/null
+++ b/scripts/sbom/sbom/spdx/__init__.py
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+from .spdxId import SpdxId, SpdxIdGenerator
+from .serialization import JsonLdSpdxDocument
+
+__all__ =3D ["JsonLdSpdxDocument", "SpdxId", "SpdxIdGenerator"]
diff --git a/scripts/sbom/sbom/spdx/build.py b/scripts/sbom/sbom/spdx/bui=
ld.py
new file mode 100644
index 00000000000..a39ec9c09b1
--- /dev/null
+++ b/scripts/sbom/sbom/spdx/build.py
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+from dataclasses import dataclass, field
+from sbom.spdx.core import DictionaryEntry, Element, Hash
+
+
+@dataclass(kw_only=3DTrue)
+class Build(Element):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Build/Classes/Build=
/"""
+
+    type: str =3D field(init=3DFalse, default=3D"build_Build")
+    build_buildType: str
+    build_buildId: str
+    build_environment: list[DictionaryEntry] =3D field(default_factory=3D=
list)
+    build_configSourceUri: list[str] =3D field(default_factory=3Dlist)
+    build_configSourceDigest: list[Hash] =3D field(default_factory=3Dlis=
t)
diff --git a/scripts/sbom/sbom/spdx/core.py b/scripts/sbom/sbom/spdx/core=
.py
new file mode 100644
index 00000000000..7eb376a1cd8
--- /dev/null
+++ b/scripts/sbom/sbom/spdx/core.py
@@ -0,0 +1,170 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+from dataclasses import dataclass, field
+
+from typing import Any, Literal
+from sbom.spdx.spdxId import SpdxId
+
+SPDX_SPEC_VERSION =3D "3.0.1"
+
+ExternalIdentifierType =3D Literal["email", "gitoid", "urlScheme"]
+HashAlgorithm =3D Literal["sha256", "sha512"]
+ProfileIdentifierType =3D Literal["core", "software", "build", "lite", "=
simpleLicensing"]
+RelationshipType =3D Literal[
+    "contains",
+    "generates",
+    "hasDeclaredLicense",
+    "hasInput",
+    "hasOutput",
+    "ancestorOf",
+    "hasDistributionArtifact",
+    "dependsOn",
+]
+RelationshipCompleteness =3D Literal["complete", "incomplete", "noAssert=
ion"]
+
+
+@dataclass
+class SpdxObject:
+    def to_dict(self) -> dict[str, Any]:
+        def _to_dict(v: Any):
+            return v.to_dict() if hasattr(v, "to_dict") else v
+
+        d: dict[str, Any] =3D {}
+        for field_name in self.__dataclass_fields__:
+            value =3D getattr(self, field_name)
+            if value is None or value =3D=3D [] or value =3D=3D "":
+                continue
+
+            if isinstance(value, Element):
+                d[field_name] =3D value.spdxId
+            elif isinstance(value, list) and len(value) > 0 and isinstan=
ce(value[0], Element):  # type: ignore
+                value: list[Element] =3D value
+                d[field_name] =3D [v.spdxId for v in value]
+            else:
+                d[field_name] =3D [_to_dict(v) for v in value] if isinst=
ance(value, list) else _to_dict(value)  # type: ignore
+        return d
+
+
+@dataclass(kw_only=3DTrue)
+class IntegrityMethod(SpdxObject):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Integr=
ityMethod/"""
+
+
+@dataclass(kw_only=3DTrue)
+class Hash(IntegrityMethod):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Hash/"=
""
+
+    type: str =3D field(init=3DFalse, default=3D"Hash")
+    hashValue: str
+    algorithm: HashAlgorithm
+
+
+@dataclass(kw_only=3DTrue)
+class Element(SpdxObject):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Elemen=
t/"""
+
+    type: str =3D field(init=3DFalse, default=3D"Element")
+    spdxId: SpdxId
+    creationInfo: str =3D "_:creationinfo"
+    name: str | None =3D None
+    verifiedUsing: list[Hash] =3D field(default_factory=3Dlist)
+    comment: str | None =3D None
+
+
+@dataclass(kw_only=3DTrue)
+class ExternalMap(SpdxObject):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Extern=
alMap/"""
+
+    type: str =3D field(init=3DFalse, default=3D"ExternalMap")
+    externalSpdxId: SpdxId
+
+
+@dataclass(kw_only=3DTrue)
+class NamespaceMap(SpdxObject):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Namesp=
aceMap/"""
+
+    type: str =3D field(init=3DFalse, default=3D"NamespaceMap")
+    prefix: str
+    namespace: str
+
+
+@dataclass(kw_only=3DTrue)
+class ElementCollection(Element):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Elemen=
tCollection/"""
+
+    type: str =3D field(init=3DFalse, default=3D"ElementCollection")
+    element: list[Element] =3D field(default_factory=3Dlist)
+    rootElement: list[Element] =3D field(default_factory=3Dlist)
+    profileConformance: list[ProfileIdentifierType] =3D field(default_fa=
ctory=3Dlist)
+
+
+@dataclass(kw_only=3DTrue)
+class SpdxDocument(ElementCollection):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/SpdxDo=
cument/"""
+
+    type: str =3D field(init=3DFalse, default=3D"SpdxDocument")
+    import_: list[ExternalMap] =3D field(default_factory=3Dlist)
+    namespaceMap: list[NamespaceMap] =3D field(default_factory=3Dlist)
+
+    def to_dict(self) -> dict[str, Any]:
+        return {("import" if k =3D=3D "import_" else k): v for k, v in s=
uper().to_dict().items()}
+
+
+@dataclass(kw_only=3DTrue)
+class Agent(Element):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Agent/=
"""
+
+    type: str =3D field(init=3DFalse, default=3D"Agent")
+
+
+@dataclass(kw_only=3DTrue)
+class SoftwareAgent(Agent):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Softwa=
reAgent/"""
+
+    type: str =3D field(init=3DFalse, default=3D"SoftwareAgent")
+
+
+@dataclass(kw_only=3DTrue)
+class CreationInfo(SpdxObject):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Creati=
onInfo/"""
+
+    type: str =3D field(init=3DFalse, default=3D"CreationInfo")
+    id: SpdxId =3D "_:creationinfo"
+    specVersion: str =3D SPDX_SPEC_VERSION
+    createdBy: list[Agent]
+    created: str
+    comment: str | None =3D None
+
+    def to_dict(self) -> dict[str, Any]:
+        return {("@id" if k =3D=3D "id" else k): v for k, v in super().t=
o_dict().items()}
+
+
+@dataclass(kw_only=3DTrue)
+class Relationship(Element):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Relati=
onship/"""
+
+    type: str =3D field(init=3DFalse, default=3D"Relationship")
+    relationshipType: RelationshipType
+    from_: Element  # underscore because 'from' is a reserved keyword
+    to: list[Element]
+    completeness: RelationshipCompleteness | None =3D None
+
+    def to_dict(self) -> dict[str, Any]:
+        return {("from" if k =3D=3D "from_" else k): v for k, v in super=
().to_dict().items()}
+
+
+@dataclass(kw_only=3DTrue)
+class Artifact(Element):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Artifa=
ct/"""
+
+    type: str =3D field(init=3DFalse, default=3D"Artifact")
+
+
+@dataclass(kw_only=3DTrue)
+class DictionaryEntry(SpdxObject):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Dictio=
naryEntry/"""
+
+    type: str =3D field(init=3DFalse, default=3D"DictionaryEntry")
+    key: str
+    value: str
diff --git a/scripts/sbom/sbom/spdx/serialization.py b/scripts/sbom/sbom/=
spdx/serialization.py
new file mode 100644
index 00000000000..b4df7d368d4
--- /dev/null
+++ b/scripts/sbom/sbom/spdx/serialization.py
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+import json
+from typing import Any
+from sbom.path_utils import PathStr
+from sbom.spdx.core import SPDX_SPEC_VERSION, SpdxDocument, SpdxObject
+
+
+class JsonLdSpdxDocument:
+    """Represents an SPDX document in JSON-LD format for serialization."=
""
+
+    graph: list[SpdxObject]
+
+    def __init__(self, graph: list[SpdxObject]) -> None:
+        """
+        Initialize a JSON-LD SPDX document from a graph of SPDX objects.
+        The graph must contain a single SpdxDocument element.
+
+        Args:
+            graph: List of SPDX objects representing the complete SPDX d=
ocument.
+        """
+        self.graph =3D graph
+
+    @property
+    def context(self) -> list[str | dict[str, str]]:
+        spdx_document =3D next(element for element in self.graph if isin=
stance(element, SpdxDocument))
+        return [
+            f"https://spdx.org/rdf/{SPDX_SPEC_VERSION}/spdx-context.json=
ld",
+            {ns.prefix: ns.namespace for ns in spdx_document.namespaceMa=
p},
+        ]
+
+    def to_dict(self) -> dict[str, Any]:
+        """
+        Convert the SPDX document to a dictionary representation suitabl=
e for JSON serialization.
+
+        Returns:
+            Dictionary with @context and @graph keys following JSON-LD f=
ormat.
+        """
+        def _item_to_dict(item: SpdxObject) -> dict:
+            d =3D item.to_dict()
+            if isinstance(item, SpdxDocument):
+                d.pop("namespaceMap", None)
+            return d
+        return {
+            "@context": self.context,
+            "@graph": [_item_to_dict(item) for item in self.graph],
+        }
+
+    def save(self, path: PathStr, prettify: bool) -> None:
+        """
+        Save the SPDX document to a JSON file.
+
+        Args:
+            path: File path where the document will be saved.
+            prettify: Whether to pretty-print the JSON with indentation.
+        """
+        with open(path, "w", encoding=3D"utf-8") as f:
+            if prettify:
+                json.dump(self.to_dict(), f, indent=3D2)
+            else:
+                json.dump(self.to_dict(), f, separators=3D(",", ":"))
diff --git a/scripts/sbom/sbom/spdx/simplelicensing.py b/scripts/sbom/sbo=
m/spdx/simplelicensing.py
new file mode 100644
index 00000000000..750ddd24ad8
--- /dev/null
+++ b/scripts/sbom/sbom/spdx/simplelicensing.py
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+from dataclasses import dataclass, field
+from sbom.spdx.core import Element
+
+
+@dataclass(kw_only=3DTrue)
+class AnyLicenseInfo(Element):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/SimpleLicensing/Cla=
sses/AnyLicenseInfo/"""
+
+    type: str =3D field(init=3DFalse, default=3D"simplelicensing_AnyLice=
nseInfo")
+
+
+@dataclass(kw_only=3DTrue)
+class LicenseExpression(AnyLicenseInfo):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/SimpleLicensing/Cla=
sses/LicenseExpression/"""
+
+    type: str =3D field(init=3DFalse, default=3D"simplelicensing_License=
Expression")
+    simplelicensing_licenseExpression: str
diff --git a/scripts/sbom/sbom/spdx/software.py b/scripts/sbom/sbom/spdx/=
software.py
new file mode 100644
index 00000000000..2f46de7c316
--- /dev/null
+++ b/scripts/sbom/sbom/spdx/software.py
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+from dataclasses import dataclass, field
+from typing import Literal
+from sbom.spdx.core import Artifact, ElementCollection, IntegrityMethod
+
+
+SbomType =3D Literal["source", "build"]
+FileKindType =3D Literal["file", "directory"]
+SoftwarePurpose =3D Literal[
+    "source",
+    "archive",
+    "library",
+    "file",
+    "data",
+    "configuration",
+    "executable",
+    "module",
+    "application",
+    "documentation",
+    "other",
+]
+ContentIdentifierType =3D Literal["gitoid", "swhid"]
+
+
+@dataclass(kw_only=3DTrue)
+class Sbom(ElementCollection):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Software/Classes/Sb=
om/"""
+
+    type: str =3D field(init=3DFalse, default=3D"software_Sbom")
+    software_sbomType: list[SbomType] =3D field(default_factory=3Dlist)
+
+
+@dataclass(kw_only=3DTrue)
+class ContentIdentifier(IntegrityMethod):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Software/Classes/Co=
ntentIdentifier/"""
+
+    type: str =3D field(init=3DFalse, default=3D"software_ContentIdentif=
ier")
+    software_contentIdentifierType: ContentIdentifierType
+    software_contentIdentifierValue: str
+
+
+@dataclass(kw_only=3DTrue)
+class SoftwareArtifact(Artifact):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Software/Classes/So=
ftwareArtifact/"""
+
+    type: str =3D field(init=3DFalse, default=3D"software_Artifact")
+    software_primaryPurpose: SoftwarePurpose | None =3D None
+    software_copyrightText: str | None =3D None
+    software_contentIdentifier: list[ContentIdentifier] =3D field(defaul=
t_factory=3Dlist)
+
+
+@dataclass(kw_only=3DTrue)
+class Package(SoftwareArtifact):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Software/Classes/Pa=
ckage/"""
+
+    type: str =3D field(init=3DFalse, default=3D"software_Package")
+    name: str  # type: ignore
+    software_packageVersion: str | None =3D None
+
+
+@dataclass(kw_only=3DTrue)
+class File(SoftwareArtifact):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Software/Classes/Fi=
le/"""
+
+    type: str =3D field(init=3DFalse, default=3D"software_File")
+    name: str  # type: ignore
+    software_fileKind: FileKindType | None =3D None
diff --git a/scripts/sbom/sbom/spdx/spdxId.py b/scripts/sbom/sbom/spdx/sp=
dxId.py
new file mode 100644
index 00000000000..589e85c5f70
--- /dev/null
+++ b/scripts/sbom/sbom/spdx/spdxId.py
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+from itertools import count
+from typing import Iterator
+
+SpdxId =3D str
+
+
+class SpdxIdGenerator:
+    _namespace: str
+    _prefix: str | None =3D None
+    _counter: Iterator[int]
+
+    def __init__(self, namespace: str, prefix: str | None =3D None) -> N=
one:
+        """
+        Initialize the SPDX ID generator with a namespace.
+
+        Args:
+            namespace: The full namespace to use for generated IDs.
+            prefix: Optional. If provided, generated IDs will use this p=
refix instead of the full namespace.
+        """
+        self._namespace =3D namespace
+        self._prefix =3D prefix
+        self._counter =3D count(0)
+
+    def generate(self) -> SpdxId:
+        return f"{f'{self._prefix}:' if self._prefix else self._namespac=
e}{next(self._counter)}"
+
+    @property
+    def prefix(self) -> str | None:
+        return self._prefix
+
+    @property
+    def namespace(self) -> str:
+        return self._namespace
--=20
2.43.0


